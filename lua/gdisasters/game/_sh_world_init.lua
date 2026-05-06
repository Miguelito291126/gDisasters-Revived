SetGlobalFloat("gdr_dseismic_activity", 0)

--Global_System table

gDisasters_Revived.GLOBAL_SYSTEM = {
				["Atmosphere"] 	= {
						["Wind"]        = {
											["Speed"]=0,
											["Direction"]=Vector(1,0,0),
											["NextThink"]=CurTime()
										   },

										
					
						["Pressure"]    = 100000,
						
						["Temperature"] = 23,
						
						["Humidity"]    = 25,
					
						["BRadiation"]  = 0.1,

						["Oxygen"]  = 100
				}
				}
				
gDisasters_Revived.GLOBAL_SYSTEM_TARGET = {
				["Atmosphere"] 	= {
						["Wind"]        = {
											["Speed"]=0,
											["Direction"]=Vector(1,0,0)
										   },
					
						["Pressure"]    = 100000,
						
						["Temperature"] = 23,
						
						["Humidity"]    = 25,
					
						["BRadiation"]  = 0.1,

						["Oxygen"]  = 100


				}
				}
				
gDisasters_Revived.GLOBAL_SYSTEM_ORIGINAL = {
				["Atmosphere"] 	= {
						["Wind"]        = {
											["Speed"]=0,
											["Direction"]=Vector(1,0,0)
										   },
						
					
						["Pressure"]    = 100000,
						
						["Temperature"] = 23,
						
						["Humidity"]    = 25,
					
						["BRadiation"]  = 0.1,

						["Oxygen"]  = 100
				}
				}



--concommands

concommand.Add("gdisasters_revived_smite", function()

	local bounds    = gDisasters_Revived.getMapSkyBox()
	local min       = bounds[1]
	local max       = bounds[2]
	
	
	
	local startpos  = Vector(math.random(min.x, max.x), math.random(min.y, max.y), max.z)
	local tr = util.TraceLine( {
		start = startpos,
		endpos = startpos - Vector(0,0,50000),
	} )
	
	local endpos = tr.HitPos
	
	
	local color = table.Random({"blue", "purple"})
	local grounded = table.Random({"NotGrounded","Grounded"})
	
	CreateLightningBolt(startpos, endpos,  {"purple","blue"} ,  {"Grounded","NotGrounded"} )


end)

concommand.Add("setlight", function(ply, cmd, args)
	gDisasters_Revived.setMapLight(args[1])
end)

concommand.Add("setposme", function(ply, cmd, args)
	ply:SetPos(ply:GetEyeTrace().HitPos)
end)


concommand.Add("tickrate", function(ply, cmd, args)
	print( 1 / engine.TickInterval())
end)

concommand.Add("unfreeze", function()

	for k, v in pairs(ents.GetAll()) do
		if v:GetPhysicsObject():IsValid() then v:GetPhysicsObject():EnableMotion(true) v:GetPhysicsObject():Wake() end 
	end
end)


concommand.Add("getpropnum", function()

	print(#ents.FindByClass("prop_physics"))
end)

concommand.Add("gdisasters_revived_heat_system_getcellslist", function()

	PrintTable(gDisasters_Revived.HeatSystem.GridMap)
end)
concommand.Add("gdisasters_revived_heat_system_getcurrentcell", function(ply)
	local pos = ply:GetPos()
	local px, py, pz = math.floor(pos.x / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize, math.floor(pos.y / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize, math.floor(pos.z / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize
	
	PrintTable(gDisasters_Revived.HeatSystem.GridMap[px][py][pz])
end)

concommand.Add("gdisasters_revived_heat_system_getcellpos", function(ply)
	local pos = ply:GetPos()
	local px, py, pz = math.floor(pos.x / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize, math.floor(pos.y / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize, math.floor(pos.z / gDisasters_Revived.HeatSystem.cellSize) * gDisasters_Revived.HeatSystem.cellSize
	
	if gDisasters_Revived.HeatSystem.GridMap[px][py][pz] then
		print("Position: X= " .. px, "Y= " .. py, "Z= " .. pz)
	end
end)

concommand.Add("gdisasters_revived_heat_system_getlandcells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.LandSources)
end)

concommand.Add("gdisasters_revived_heat_system_getwatercells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.WaterSources)
end)

concommand.Add("gdisasters_revived_heat_system_getaircells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.AirSources)
end)

concommand.Add("gdisasters_revived_heat_system_getgrasscells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.GrassSources)
end)

concommand.Add("gdisasters_revived_heat_system_getsnowcells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.SnowSources)
end)

concommand.Add("gdisasters_revived_heat_system_getsandcells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.SandSources)
end)

concommand.Add("gdisasters_revived_heat_system_getasfaltcells", function(ply)
	PrintTable(gDisasters_Revived.HeatSystem.AsfaltSources)
end)

concommand.Add("ent_getinfo", function(ply)

	local ent = ply:GetEyeTrace().Entity
	PrintTable(ent:GetTable())
end)

concommand.Add("ent_getall", function()
	for k, v in pairs(ents.GetAll()) do
		print(v)
	end
end)

concommand.Add("freeze", function()

	for k, v in pairs(ents.GetAll()) do
		if v:GetPhysicsObject():IsValid() then v:GetPhysicsObject():EnableMotion(false)  end 
	end
end)


concommand.Add("gdisasters_revived_settemp", function(cmd, args, temp)
	local temperature = temp[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Temperature"] = tonumber(temperature)
end)



concommand.Add("gdisasters_revived_setwind", function(cmd, args, wind)
	local speed = wind[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Wind"]["Speed"] = tonumber(speed)
end)

concommand.Add("gdisasters_revived_setwind_direction", function(cmd, args, wind)
	local direction = Vector(tonumber(wind[1]), tonumber(wind[2]), tonumber(wind[3]))
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Wind"]["Direction"] = direction
end)


concommand.Add("gdisasters_revived_setbody_temp", function(cmd, args, temp)
	for k, v in pairs(player.GetAll()) do
		local temperature = temp[1]
		v.gDisasters_Revived.Body.Temperature = tonumber(temperature)
		
	end
end)

concommand.Add("gdisasters_revived_setbody_oxygen", function(cmd, args, O2)
	for k, v in pairs(player.GetAll()) do
		local Oxygen = O2[1]
		v.gDisasters_Revived.Body.Oxygen = tonumber(Oxygen)
		
	end
end)

concommand.Add("gdisasters_revived_dnc_getmoondirindegrees", function(cmd, args, O2)
	print(gDisasters_Revived.Revived_GetMoonAngleInDegs())
end)

concommand.Add("gdisasters_revived_dnc_getsundirindegrees", function(cmd, args, O2)
	print(gDisasters_Revived.Revived_GetSunAngleInDegs())
end)

concommand.Add("gdisasters_revived_setpressure", function(cmd, args, pressure)
	local press = pressure[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Pressure"] = tonumber(press)
end)

concommand.Add("gdisasters_revived_sethumidity", function(cmd, args, humidity)
	local humi =  humidity[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Humidity"] = tonumber(humi)
end)

concommand.Add("gdisasters_revived_setbdadiation", function(cmd, args, BRadiation)
	local BR =  BRadiation[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["BRadiation"] = tonumber(BR)
end)
concommand.Add("gdisasters_revived_setoxygen", function(cmd, args, Oxygen)
	local Ox = Oxygen[1]
	gDisasters_Revived.GLOBAL_SYSTEM_TARGET["Atmosphere"]["Oxygen"] = tonumber(Ox)
end)

concommand.Add("getmap", function()
	print(game.GetMap())
end)

concommand.Add("gdisasters_revived_dnc_getsundir", function(cmd, args, O2)
	print(gDisasters_Revived.Revived_GetSunDir())
end)

concommand.Add("gdisasters_revived_dnc_getmoondir", function(cmd, args, O2)
	print(gDisasters_Revived.Revived_GetMoonDir())
end)

concommand.Add( "gdisasters_revived_dnc_pause", function( pl, cmd, args )

	if ( !IsValid( pl ) or !pl:IsAdmin() and !IsSuperAdmin() ) then return end

	gdisasters_revived_.DayNightSystem.TogglePause()

	if ( IsValid( pl ) ) then

		pl:PrintMessage( HUD_PRINTCONSOLE, "DNC is " .. (gdisasters_revived_.DayNightSystem.Paused and "paused" or "no longer paused") );

	else

		print( "DNC is " .. (gdisasters_revived_.DayNightSystem.Paused and "paused" or "no longer paused") );

	end

end );

concommand.Add( "gdisasters_revived_dnc_settime", function( pl, cmd, args )

	if ( !IsValid( pl ) or !pl:IsAdmin() and !IsSuperAdmin() ) then return end

	gdisasters_revived_.DayNightSystem.SetTime( tonumber( args[1] or "0" ) );

end );

concommand.Add( "gdisasters_revived_dnc_gettime", function( pl, cmd, args )

	local time = gdisasters_revived_.DayNightSystem.GetTime();
	local hours = math.floor( time );
	local minutes = ( time - hours ) * 60;

	if ( IsValid( pl ) ) then

		pl:PrintMessage( HUD_PRINTCONSOLE, string.format( "The current time is %s", string.format( "%02i:%02i", hours, minutes ) ) );

	else

		print( string.format( "The current time is %s", string.format( "%02i:%02i", hours, minutes ) ) );

	end

end );
hook.Add( "Think", "gDisastersRevivedSettingSunDir", function()
	if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 and GetConVar( "gdisasters_revived_dnc_enabled", "0", {FCVAR_ARCHIVE}, "" ):GetInt() <= 0 then 
		local env_sun = ents.FindByClass("env_sun")[1]
		if env_sun then
			local sunDir = env_sun:GetInternalVariable("sun_dir")
			gDisasters_Revived.SetSunDir(sunDir)
		end
	end
end)