--class
gDisasters_Revived = {}
gDisasters_Revived.Version = 0.531
gDisasters_Revived.WorkShopURL = "https://steamcommunity.com/sharedfiles/filedetails/?id=2522900784"
gDisasters_Revived.WorkshopVersion = true
gDisasters_Revived.lua_Directory = "gdisasters"
gDisasters_Revived.resources_Directory = "resource/localization"
gDisasters_Revived.materials_Directory = "materials"
gDisasters_Revived.sounds_Directory = "sound/streams"
gDisasters_Revived.models_Directory = "models/ramses/models"
gDisasters_Revived.decals_Directory = "materials/decals/gdisasters" 
gDisasters_Revived.particles_Directory = "particles/gdisasters" 

local snowtable = {}
local sandtable = {}
local icetable = {}

for _,v in pairs(engine.GetAddons()) do
	if v.downloaded and tonumber(v.wsid) == 2522900784 or v.title == "gDisasters Base Pack 2" then
		gDisasters_Revived.WorkshopVersion = true
		break
	end
end

print("Workshop Version == ".. tostring(gDisasters_Revived.WorkshopVersion))

--functions

local env_color = SERVER and Color(138,223,255) or Color(230,217,111)

function gDisasters_Revived.dump(o)
	if type(o) == 'table' then
		local s = '{ '
		for k,v in pairs(o) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s .. '['..k..'] = ' .. dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

function gDisasters_Revived.is_done(x, y)
	if x == y then
		return true
	end
	return false
end

function gDisasters_Revived.Msg(...)
	local a = {...}
	table.insert(a, 1, env_color)
	local t = {}
	local last = 0
	for _, v in ipairs(a) do
		local cur = 0
		if type(v) == "string" then
			cur = 1
		elseif type(v) == "table" then
			cur = 2
		end
		if last == cur then
			if cur == 1 then
				t[#t] = t[#t] .. " " .. v
				break
			elseif cur == 2 then
				t[#t] = dump(v)
				break
			end
		end
		last = cur
		table.insert(t,v)
	end
	MsgC(Color(255,136,0),"[gDisasters] ",unpack( t ))
	MsgN()
end

function gDisasters_Revived.Warning( sMessage, bError )
	MsgC(Color(255,136,0),"[gDisasters]",Color(255,75,75)," [WARNING] ",env_color,sMessage,"\n")
	if bError then
		error(sMessage)
	end
end




--loading lua files

gDisasters_Revived.Msg("INCLUDING LUA FILES...")



function gDisasters_Revived.IncludeFile( File, directory )
	if string.StartWith(File, "_sv_") or string.StartWith(File, "sv_") then
		if SERVER then
			include( directory .. File )
			gDisasters_Revived.Msg( "SERVER INCLUDE: " .. File )
		end
	elseif string.StartWith(File, "_sh_") or string.StartWith(File, "sh_") then
		if SERVER then
			AddCSLuaFile( directory .. File )
			gDisasters_Revived.Msg( "SHARED ADDCS: " .. File )
		end
		include( directory .. File )
		gDisasters_Revived.Msg( "SHARED INCLUDE: " .. File )
	elseif string.StartWith(File, "_cl_") or string.StartWith(File, "cl_") then
		if SERVER then
			AddCSLuaFile( directory .. File )
			gDisasters_Revived.Msg( "CLIENT ADDCS: " .. File )
		elseif CLIENT then
			include( directory .. File )
			gDisasters_Revived.Msg( "CLIENT INCLUDE: " .. File )
		end
	end
end

function gDisasters_Revived.loadluafiles( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "LUA" )

	for _, v in ipairs( files ) do
		if string.EndsWith( v, ".lua" ) then
			gDisasters_Revived.IncludeFile( v, directory )
		end
	end

	for _, v in ipairs( directories ) do
		gDisasters_Revived.Msg( "Directory: " .. v )
		gDisasters_Revived.loadluafiles( directory .. v )
	end
end

gDisasters_Revived.loadluafiles( gDisasters_Revived.lua_Directory )

gDisasters_Revived.Msg("FINISH")

--adding materials and sounds and models to client

if SERVER then

	gDisasters_Revived.Msg("DOWNLOADING BASIC...")
	
	function gDisasters_Revived.AddResourceFile( File, directory )
		resource.AddSingleFile( directory .. File )
		gDisasters_Revived.Msg( "ADDING: " .. File )
	end

	function gDisasters_Revived.loadresourcefiles( directory )
		directory = directory .. "/"

		local files, directories = file.Find( directory .. "*", "THIRDPARTY" )

		for _, v in ipairs( files ) do	
			if !string.EndsWith( v, ".png" ) and !string.EndsWith( v, ".vtf" ) then 
				gDisasters_Revived.AddResourceFile( v, directory )		
			end	
		end

		for _, v in ipairs( directories ) do
			gDisasters_Revived.Msg( "Directory: " .. v )
			gDisasters_Revived.loadresourcefiles( directory .. v )
		end
	end

	gDisasters_Revived.loadresourcefiles(gDisasters_Revived.resources_Directory)

	if not gDisasters_Revived.WorkshopVersion then

		gDisasters_Revived.Msg("ADDING CONTENT FILE...")

		function gDisasters_Revived.AddResourceFile( File, directory )
			resource.AddSingleFile( directory .. File )
			gDisasters_Revived.Msg( "ADDING: " .. File )
		end

		function gDisasters_Revived.loadresourcefiles( directory )
			directory = directory .. "/"

			local files, directories = file.Find( directory .. "*", "THIRDPARTY" )

			for _, v in ipairs( files ) do	
				if !string.EndsWith( v, ".png" ) and !string.EndsWith( v, ".vtf" ) then 
					gDisasters_Revived.AddResourceFile( v, directory )
				end
			end

			for _, v in ipairs( directories ) do
				gDisasters_Revived.Msg( "Directory: " .. v )
				gDisasters_Revived.loadresourcefiles( directory .. v )
			end
		end

		gDisasters_Revived.loadresourcefiles(gDisasters_Revived.materials_Directory)
		gDisasters_Revived.loadresourcefiles(gDisasters_Revived.sounds_Directory)
		gDisasters_Revived.loadresourcefiles(gDisasters_Revived.models_Directory)

		gDisasters_Revived.Msg("ADDED CONTENT FILE")
		
	else
		gDisasters_Revived.Msg("ADDING CONTENT FILE FROM WORKSHOP...")
		resource.AddWorkshop(string.match(gDisasters_Revived.WorkShopURL, "%d+$"))
		gDisasters_Revived.Msg("ADDED CONTENT FILE FROM WORKSHOP")
	end

	gDisasters_Revived.Msg("FINISH")
end

--loading decals

gDisasters_Revived.Msg("LOADING DECALS...")



function gDisasters_Revived.AddDecalsFile( Key, File, directory)
	local name = File:match("(.+)%..+$")
	directory = directory:match("materials/(.-)/") .. "/gdisasters/" .. name

	if string.StartWith(File, "_ice") then
		table.insert(icetable,  directory)
	elseif string.StartWith(File, "_sand") then
		table.insert(sandtable,  directory)
	elseif string.StartWith(File, "_snow") then
		table.insert(snowtable,  directory)
	else	
		gDisasters_Revived.Msg( "ADDING: " .. name .. " DECAL")
		game.AddDecal(name, directory)
		gDisasters_Revived.Msg( "ADDED")
	end

	if gDisasters_Revived.is_done(Key, 21) then
		
		gDisasters_Revived.Msg( "ADDING ICE DECALS")
		game.AddDecal( "ice", icetable)
		gDisasters_Revived.Msg( "ADDED ICE DECALS")

		gDisasters_Revived.Msg( "ADDING SAND DECALS")
		game.AddDecal( "sand", sandtable)
		gDisasters_Revived.Msg( "ADDED SAND DECALS")

		gDisasters_Revived.Msg( "ADDING SNOW DECALS")
		game.AddDecal( "snow", snowtable)
		gDisasters_Revived.Msg( "ADDED SNOW DECALS")
	end
	
	
end

function gDisasters_Revived.loaddecalsfiles( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "THIRDPARTY" )

	for k, v in ipairs( files ) do
		if !string.EndsWith( v, ".png" ) and !string.EndsWith( v, ".vtf" ) then 
			gDisasters_Revived.AddDecalsFile( k, v, directory)
		end
	end

	for _, v in ipairs( directories ) do
		gDisasters_Revived.Msg( "Directory: " .. v )
		gDisasters_Revived.loaddecalsfiles( directory .. v )
	end
end

gDisasters_Revived.loaddecalsfiles(gDisasters_Revived.decals_Directory)

gDisasters_Revived.Msg("FINISH")

--adding particles

gDisasters_Revived.Msg("LOADING PARTICLES...")

function gDisasters_Revived.AddParticleFile( File, directory )
	game.AddParticles( directory .. File )
	gDisasters_Revived.Msg( "ADDING: " .. File )
end

function gDisasters_Revived.loadparticlesfiles( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "THIRDPARTY" )

	for _, v in ipairs( files ) do
		if string.EndsWith( v, ".pcf" ) then
			gDisasters_Revived.AddParticleFile( v, directory )
		end
	end

	for _, v in ipairs( directories ) do
		gDisasters_Revived.Msg( "Directory: " .. v )
		gDisasters_Revived.loadparticlesfiles( directory .. v )
	end
end

gDisasters_Revived.loadparticlesfiles( gDisasters_Revived.particles_Directory)

gDisasters_Revived.Msg("FINISH")


--prechaching the particles

gDisasters_Revived.Msg("PRECHACHING PARTICLES...")

PrecacheParticleSystem("localized_dust_effect")
PrecacheParticleSystem("localized_sand_effect")
PrecacheParticleSystem("localized_rain_effect")
PrecacheParticleSystem("localized_light_rain_effect")
PrecacheParticleSystem("localized_extreme_rain_effect")
PrecacheParticleSystem("localized_ash_effect")
PrecacheParticleSystem("darkness_approaches_main")
PrecacheParticleSystem("localized_snow_effect")
PrecacheParticleSystem("localized_heavy_snow_effect")
PrecacheParticleSystem("localized_sleet_effect")
PrecacheParticleSystem("localized_acid_rain_effect")
PrecacheParticleSystem("localized_ash_effect_2")
PrecacheParticleSystem("heatwave_ripple_01_main")
PrecacheParticleSystem("hail_character_effect_01_main")
PrecacheParticleSystem("meteorite_burnup_trail_main")
PrecacheParticleSystem("meteor_explosion_main_ground")
PrecacheParticleSystem("meteorite_explosion_main_ground")
PrecacheParticleSystem("meteor_burnup_main")
PrecacheParticleSystem("meteorite_skyripple")
PrecacheParticleSystem("tumbleweed_effect")
PrecacheParticleSystem("moderate_rain_effect")
PrecacheParticleSystem("shootingstar_burnup_main")
PrecacheParticleSystem("mini_firenado")
PrecacheParticleSystem("small_mini_firenado_hd_main")
PrecacheParticleSystem("localized_firestorm_effect")

PrecacheParticleSystem( "dryice_lowfog_crawler" )
PrecacheParticleSystem( "dryice_medfog_crawler" )
PrecacheParticleSystem( "dryice_deepfog_crawler" )
PrecacheParticleSystem( "dryice_fog_explosion" )
PrecacheParticleSystem( "dryice_melting" )

PrecacheParticleSystem("rain_ceiling_drops_effect")
PrecacheParticleSystem("rain_ceiling_drop_ground_splash")

PrecacheParticleSystem("downburst_light_rain_main")
PrecacheParticleSystem("downburst_medium_rain_main")
PrecacheParticleSystem("downburst_heavy_rain_main")

PrecacheParticleSystem("extreme_rain_splash_effect")
PrecacheParticleSystem("heavy_rain_splash_effect")
PrecacheParticleSystem("heavy_snow_ground_effect")
PrecacheParticleSystem("snow_ground_effect")
PrecacheParticleSystem("snow_gust_effect")
PrecacheParticleSystem("sleet_splash_effect")
PrecacheParticleSystem("rain_splash_effect")
PrecacheParticleSystem("light_rain_splash_a")
PrecacheParticleSystem("tumbleweed_effect")

PrecacheParticleSystem("water_huge")
PrecacheParticleSystem("water_medium")
PrecacheParticleSystem("water_small")
PrecacheParticleSystem("water_torpedo")

PrecacheParticleSystem("heatburst_air_compression_main")

PrecacheParticleSystem("neutron_star_magnetic_field_lines_main")
PrecacheParticleSystem("neutron_star_ray_main")
PrecacheParticleSystem("localized_blizzard_effect")
PrecacheParticleSystem("hail_character_effect_02_main")

PrecacheParticleSystem("sumerged_volcano_main")
PrecacheParticleSystem("sumerged_bigvolcano_main")


-- character_effects.pcf
PrecacheParticleSystem("exhale")
PrecacheParticleSystem("vomit_main")
PrecacheParticleSystem("cough_ash")
PrecacheParticleSystem("sneeze_main")
PrecacheParticleSystem("sneeze_big_main")

-- gustnado
PrecacheParticleSystem("gustnado_01_main")
PrecacheParticleSystem("gustnado_02_main")
PrecacheParticleSystem("gustnado_03_main")
PrecacheParticleSystem("gustnado_04_main")
PrecacheParticleSystem("gustnado_05_main")
PrecacheParticleSystem("gustnado_06_main")

-- ef0
PrecacheParticleSystem("h_ef0")
PrecacheParticleSystem("temp_EF0")
PrecacheParticleSystem("t_ef0")
PrecacheParticleSystem("har_ef0")
PrecacheParticleSystem("t_tornado_EF0")
PrecacheParticleSystem("h1_EF0")
PrecacheParticleSystem("t_EF0_2")
PrecacheParticleSystem("t_EF0_wip")

-- ef1
PrecacheParticleSystem("h_ef1")
PrecacheParticleSystem("t_ef1")
PrecacheParticleSystem("temp_EF1")
PrecacheParticleSystem("temp_EF1_fix")
PrecacheParticleSystem("har_ef1")
PrecacheParticleSystem("t_tornado_EF1")
PrecacheParticleSystem("h1_EF1")


PrecacheParticleSystem("har_landspout")
PrecacheParticleSystem("har_landspout_nocloud")
PrecacheParticleSystem("har_snownado")
PrecacheParticleSystem("har_snownado_nocloud")
PrecacheParticleSystem("har_waterspout")
PrecacheParticleSystem("har_waterspout_nocloud")
PrecacheParticleSystem("har_landspout")
PrecacheParticleSystem("har_landspout_nocloud")
PrecacheParticleSystem("har_snownado")
PrecacheParticleSystem("har_snownado_nocloud")
PrecacheParticleSystem("har_icenado")
PrecacheParticleSystem("har_icenado_nocloud")
PrecacheParticleSystem("alien_tornado")

-- ef2
PrecacheParticleSystem("h_ef2")
PrecacheParticleSystem("temp_EF2")
PrecacheParticleSystem("t_ef2")
PrecacheParticleSystem("har_ef2")
PrecacheParticleSystem("t_tornado_EF2")
PrecacheParticleSystem("h1_EF2")

-- ef3
PrecacheParticleSystem("h_ef3")
PrecacheParticleSystem("temp_EF3")
PrecacheParticleSystem("t_ef3")
PrecacheParticleSystem("har_ef3")
PrecacheParticleSystem("t_tornado_EF3")
PrecacheParticleSystem("h1_EF3")

-- ef4
PrecacheParticleSystem("h_ef4")
PrecacheParticleSystem("temp_EF4")
PrecacheParticleSystem("t_ef4")
PrecacheParticleSystem("har_ef4")
PrecacheParticleSystem("t_tornado_EF4")
PrecacheParticleSystem("h1_EF4")

-- ef5
PrecacheParticleSystem("h_ef5")
PrecacheParticleSystem("temp_EF5")
PrecacheParticleSystem("t_ef5")
PrecacheParticleSystem("har_ef5")
PrecacheParticleSystem("t_tornado_EF5")
PrecacheParticleSystem("h1_EF5")

-- ef6
PrecacheParticleSystem("martian_tornado")

-- ef7
PrecacheParticleSystem("f7_a")

-- firenadoes
PrecacheParticleSystem("small_mini_firenado_hd_main")
PrecacheParticleSystem("mini_firenado")
PrecacheParticleSystem("mini_firenado_hd_main")
PrecacheParticleSystem("firenado")
PrecacheParticleSystem("firenado_hd_main")
PrecacheParticleSystem("mega_firenado")

-- LIGHTNING 

PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_1")
PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_2")
PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_3")

PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_1_NON_GROUNDED")
PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_2_NON_GROUNDED")
PrecacheParticleSystem("LIGHTNING_STRIKE_BLUE_3_NON_GROUNDED")

PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_1")
PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_2")
PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_3")

PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_1_NON_GROUNDED")
PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_2_NON_GROUNDED")
PrecacheParticleSystem("LIGHTNING_STRIKE_PURPLE_3_NON_GROUNDED")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_2")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_3")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_4")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_5")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_6")
PrecacheParticleSystem("LIGHTNING_STRIKE_EXPLOSION_MAIN_7")
PrecacheParticleSystem("ball_lightning_arc_main")--
PrecacheParticleSystem("shootingstar_burnup_main")

-- fire
PrecacheParticleSystem("fire_burning_main")
PrecacheParticleSystem("darkness_arriving_main")

-- earthquake

PrecacheParticleSystem("earthquake_player_ground_rocks")
PrecacheParticleSystem("earthquake_player_ground_dust")
PrecacheParticleSystem("earthquake_player_ground_debris")
PrecacheParticleSystem("earthquake_swave_main")
PrecacheParticleSystem("earthquake_swave_refract")


-- renderfog 
PrecacheParticleSystem("renderfog_main_HQ")

-- tsunami
PrecacheParticleSystem("splash_main")
PrecacheParticleSystem("tsunami_splash_effect_r200")
PrecacheParticleSystem("tsunami_splash_effect_r300")--tsunami_splash_effect_r200
PrecacheParticleSystem("tsunami_splash_effect_r400")
PrecacheParticleSystem("tsunami_splash_effect_r500")

--black hole
PrecacheParticleSystem("micro_blackhole_effect")

gDisasters_Revived.Msg("FINISH")

--adding new hook
gDisasters_Revived.Msg("ADDING CUSTOM HOOK")
timer.Simple(1,function()
    hook.Run("PostInit")
end)

timer.Create("Think2", 0.5, 0, function()
    hook.Run("Think2")
end)

timer.Create("Think3", 1, 0, function()
    hook.Run("Think3")
end)
gDisasters_Revived.Msg("ADDED CUSTOM HOOK")