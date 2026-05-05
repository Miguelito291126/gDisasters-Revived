
gDisasters_gDisastersSetupTime = CurTime()

local function AddControlCB(CPanel, label, command)
	return CPanel:CheckBox( label, command )
end
local function AddControlLabel( CPanel, label )
	return  CPanel:Help( language.GetPhrase(label) )
end
local function AddControlSlider( CPanel, label, command, min, max, dp  )
	return  CPanel:NumSlider( label, command, min, max, dp );
end

local function AddComboBox( CPanel, title, listofitems, convar)
		
	local combobox, label = CPanel:ComboBox( language.GetPhrase(title), convar)
		
		
	for k, item in pairs(listofitems) do
		combobox:AddChoice(item)
	end
		
	return combobox
end
	
local function CreateTickboxConVariable(CPanel, desc, convarname)
	local CB = AddControlCB(CPanel, language.GetPhrase(desc), convarname)
	
 
	CB.OnChange = function( panel, bVal ) 
		if (CurTime() - gDisasters_gDisastersSetupTime) < 1 then return end 

		if( (LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() ) and !Created ) then
			if( ( bVal and 1 or 0 ) == cvars.Number( convarname ) ) then return end
			net.Start( "gdr_dclmenu_vars" );
			net.WriteString( convarname );
			net.WriteFloat( bVal and 1 or 0 );
			net.SendToServer();
			
			timer.Simple(0.1, function()
				if( CB ) then
					CB:SetValue( GetConVar(( convarname )):GetFloat() );
				end
			end)
		end
	end

	
	return CB 
	
end

local function CreateSliderConVariable(CPanel, desc, minvar, maxvar, dp, convarname)
	local CB = AddControlSlider( CPanel, language.GetPhrase(desc), convarname, minvar, maxvar, dp  )
	

	CB.OnValueChanged = function( panel, val )
		if (CurTime() - gDisasters_gDisastersSetupTime) < 1 then return end 
		
		
		if( (LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() ) and !Created ) then
			if ( tonumber(val) ) == cvars.Number( convarname )  then return end
			net.Start( "gdr_dclmenu_vars" );
			net.WriteString( convarname );
			net.WriteFloat( tonumber(val) );
			net.SendToServer();
			
			timer.Simple(0.1, function()
				
				if( CB ) then
					CB:SetValue( GetConVar(( convarname )):GetFloat() );
				end
			end)
		end
		
	end

	
	return CB
end

--SH MENU 

local function gDisastersSHSettings( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_d1" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d2"  , "gdisasters_revived_envdynamicwater_candamageconstraints");
	CreateTickboxConVariable(CPanel, "gdr_d3" ,"gdisasters_revived_envtornado_candamageconstraints");
	CreateTickboxConVariable(CPanel, "gdr_d4" ,"gdisasters_revived_wind_candamageconstraints");

	local lb3 = AddControlLabel( CPanel, "gdr_d5" )
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d6" ,"gdisasters_revived_tvirus_zombie_strength");
	CreateTickboxConVariable(CPanel, "gdr_d7" ,"gdisasters_revived_tvirus_nmrih_zombies");
end

local function gDisastersSHADVSettings( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_d8")
	local lb2 = AddControlLabel( CPanel, "gdr_d9")
	lb:SetTextColor(Color( 255, 0, 0))
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	local lb3 = AddControlLabel( CPanel, "gdr_d10")
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_d11", 0.1, 0.50, 2, "gdisasters_revived_envtornado_simquality" );
	CreateSliderConVariable(CPanel, "gdr_d12", 0.1, 0.50, 2, "gdisasters_revived_envearthquake_simquality" );
	CreateSliderConVariable(CPanel, "gdr_d13", 0.1, 0.50, 2, "gdisasters_revived_envdynamicwater_simquality");
	CreateSliderConVariable(CPanel, "gdr_d14", 0.1, 0.50, 2, "gdisasters_revived_wind_physics_simquality");

	local lb4 = AddControlLabel( CPanel, "gdr_d15" )
	lb4:SetTextColor(Color( 0, 0, 0))
	lb4:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d16" ,"gdisasters_revived_wind_physics_enabled");
	CreateTickboxConVariable(CPanel, "gdr_d17" ,"gdisasters_revived_wind_postdamage_nocollide_enabled");
	CreateTickboxConVariable(CPanel, "gdr_d18" ,"gdisasters_revived_wind_postdamage_nocollide_basetimeout");
	CreateTickboxConVariable(CPanel, "gdr_d19" ,"gdisasters_revived_wind_postdamage_nocollide_basetimeout_spread");
	CreateTickboxConVariable(CPanel, "gdr_d20" ,"gdisasters_revived_wind_postdamage_reducemass_enabled");

	local lb41 = AddControlLabel( CPanel, "gdr_d21" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d22" ,"gdisasters_revived_envearthquake_change_collision_group");

	local lb41 = AddControlLabel( CPanel, "gdr_d23" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d24" ,"gdisasters_revived_volcano_weatherchange");

	CreateSliderConVariable(CPanel, "gdr_d25", 0, 10, 2, "gdisasters_revived_volcano_pressure_increase" );
	CreateSliderConVariable(CPanel, "gdr_d26", 0, 10, 2, "gdisasters_revived_volcano_pressure_decrease" );

	local lb41 = AddControlLabel( CPanel, "gdr_d27" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d28" ,"gdisasters_revived_weather_bradiation_damage_props");
	CreateTickboxConVariable(CPanel, "gdr_d28.1" ,"gdisasters_revived_weather_bradiation_damage_npcs");

	local lb5 = AddControlLabel( CPanel, "gdr_d29" )
	lb5:SetTextColor(Color( 0, 0, 0))
	lb5:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_d30" , 0, 10000, 1,"gdisasters_revived_envdynamicwater_level_min");
	CreateSliderConVariable(CPanel, "gdr_d31", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_level_max");

	CreateSliderConVariable(CPanel, "gdr_d32", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_startlevel");
	CreateSliderConVariable(CPanel, "gdr_d33", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_middellevel");
	CreateSliderConVariable(CPanel, "gdr_d34", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_endlevel");

	CreateSliderConVariable(CPanel, "gdr_d35", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_speed");
	
	local lb6 = AddControlLabel( CPanel, "gdr_d36")
	lb6:SetTextColor(Color( 0, 0, 0))
	lb6:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d37" ,"gdisasters_revived_envtornado_manualspeed");
	CreateSliderConVariable(CPanel, "gdr_d38", 4, 20, 1, "gdisasters_revived_envtornado_speed" );
	CreateSliderConVariable(CPanel, "gdr_d39", 1, 1000, 1, "gdisasters_revived_envtornado_lifetime_min" );
	CreateSliderConVariable(CPanel, "gdr_d40", 1, 1000, 1, "gdisasters_revived_envtornado_lifetime_max" );
	CreateSliderConVariable(CPanel, "gdr_d41", 0, 5000, 1, "gdisasters_revived_envtornado_damage" );
	
	
end

local function gDisastersSHGraphics( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_d42" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d43"  , "gdisasters_revived_graphics_atmosphere");
	CreateTickboxConVariable(CPanel, "gdr_d44"  , "gdisasters_revived_graphics_gfx");
	CreateTickboxConVariable(CPanel, "gdr_d45"  , "gdisasters_revived_graphics_fog");
	

	local lb2 = AddControlLabel( CPanel, "gdr_d46" )
	local lb3 = AddControlLabel( CPanel, "gdr_d47" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	lb3:SetTextColor(Color( 0, 47, 255))

	CreateSliderConVariable(CPanel,"gdr_d48", 0, 1000, 0,"gdisasters_revived_antilag_maximum_safe_collisions_per_second_per_prop");
	CreateSliderConVariable(CPanel,"gdr_d49", 0, 1000, 0,"gdisasters_revived_antilag_post_damage_no_collide_base_time");
	CreateSliderConVariable(CPanel,"gdr_d50", 0, 1000, 0,"gdisasters_revived_antilag_maximum_safe_collisions_per_second_average" );

	local lb4 = AddControlLabel( CPanel, "gdr_d51" )
	lb4:SetTextColor(Color( 0, 0, 0))
	lb4:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel,"gdr_d52", 0, 2, 0,"gdisasters_revived_antilag_mode" );
	CreateTickboxConVariable(CPanel,"gdr_d53", "gdisasters_revived_antilag_enabled" );
	
end



local function gDisastersAutospawn( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_d54" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_d55", 1, 1000, 0, "gdisasters_revived_autospawn_spawn_timer" )
	CreateSliderConVariable(CPanel, "gdr_d56", 1, 1000, 0, "gdisasters_revived_autospawn_remove_timer" )
	CreateSliderConVariable(CPanel, "gdr_d57", 0, 1000, 0, "gdisasters_revived_autospawn_spawn_chance" )

	AddComboBox( CPanel, "Autospawn Type", {"Disasters", "Weather", "Tornado", "Weather/Disasters"}, "gdisasters_revived_autospawn_type")

	local lb2 = AddControlLabel( CPanel, "gdr_d58" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_d59"  , "gdisasters_revived_autospawn_getridmaptor");
	CreateTickboxConVariable(CPanel, "gdr_d60"  , "gdisasters_revived_autospawn_chat");
	CreateTickboxConVariable(CPanel, "gdr_d61"  , "gdisasters_revived_autospawn_enable");

	
end

local function gDisastersHeatSystemBeta( CPanel )
	CreateSliderConVariable(CPanel, "Cell Size", 1, 5000, 0, "gdisasters_revived_heat_system_cellsize" )
	CreateSliderConVariable(CPanel, "Update interval", 0, 5, 2, "gdisasters_revived_heat_system_updateinterval" )
	CreateSliderConVariable(CPanel, "Update Batch size", 1, 5000, 0, "gdisasters_revived_heat_system_updatebatchsize" )
	CreateSliderConVariable(CPanel, "Temp Difussion Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_tempdifussioncoefficient" )
	CreateSliderConVariable(CPanel, "Humidity Difussion Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_humiditydifussioncoefficient" )
	CreateSliderConVariable(CPanel, "Solar Influencies Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_solarinfluencecoefficient" )
	CreateSliderConVariable(CPanel, "Cloud density Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_clouddensitycoefficient" )
	CreateSliderConVariable(CPanel, "Convergence Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_convergencecoefficient" )
	CreateSliderConVariable(CPanel, "Terrain Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_terraincoefficient" )
	CreateSliderConVariable(CPanel, "Cooling Coeficcient", 0, 1, 2, "gdisasters_revived_heat_system_coolingcoefficient" )
	CreateSliderConVariable(CPanel, "Max hail", 1, 100, 0, "gdisasters_revived_heat_system_maxhail" )
	CreateSliderConVariable(CPanel, "Max raindrop", 1, 100, 0, "gdisasters_revived_heat_system_maxraindrop" )
	CreateSliderConVariable(CPanel, "Max clouds", 1, 100, 0, "gdisasters_revived_heat_system_maxclouds" )
	CreateSliderConVariable(CPanel, "Max Temp", -273, 273, 1, "gdisasters_revived_heat_system_maxtemp" )
	CreateSliderConVariable(CPanel, "Max Humidity", 0, 100, 0, "gdisasters_revived_heat_system_maxhumidity" )
	CreateSliderConVariable(CPanel, "Max Pressure", 94000, 106000, 0, "gdisasters_revived_heat_system_maxpressure" )
	CreateSliderConVariable(CPanel, "Max wind", 0, 100000, 0, "gdisasters_revived_heat_system_maxwind" )
	CreateSliderConVariable(CPanel, "Min Temp", -273, 273, 0, "gdisasters_revived_heat_system_mintemp" )
	CreateSliderConVariable(CPanel, "Min Humidity", 0, 100, 0, "gdisasters_revived_heat_system_minhumidity" )
	CreateSliderConVariable(CPanel, "Min Pressure", 94000, 106000, 0, "gdisasters_revived_heat_system_minpressure" )
	CreateSliderConVariable(CPanel, "Min wind", 0, 100000, 0, "gdisasters_revived_heat_system_minwind" )
	

	CreateTickboxConVariable(CPanel, "gdr_d88", "gdisasters_revived_heat_system_enabled");
	CreateTickboxConVariable(CPanel, "gdr_d87", "gdisasters_revived_graphics_draw_heatsystem_grid");
end

local function gDisastersSHhud( CPanel )

	
	local lb2 = AddControlLabel( CPanel, "gdr_d62" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d63" ,"gdisasters_revived_hud_temp_enable");
	CreateTickboxConVariable(CPanel, "gdr_d64" ,"gdisasters_revived_hud_temp_breathing");
	CreateTickboxConVariable(CPanel, "gdr_d65" ,"gdisasters_revived_hud_temp_damage");
	CreateTickboxConVariable(CPanel, "gdr_d65.1" ,"gdisasters_revived_hud_temp_npc_damage");
	CreateTickboxConVariable(CPanel, "gdr_d66" ,"gdisasters_revived_hud_temp_player_speed_enable");
	CreateTickboxConVariable(CPanel, "gdr_d67" ,"gdisasters_revived_hud_temp_value");

	CreateSliderConVariable(CPanel, "gdr_d68", 0, 1000, 0, "gdisasters_revived_hud_temp_player_speed_walk" );
	CreateSliderConVariable(CPanel, "gdr_d69", 0, 1000, 0, "gdisasters_revived_hud_temp_player_speed_sprint" );

	local lb3 = AddControlLabel( CPanel, "gdr_d70" )
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d71" ,"gdisasters_revived_hud_oxygen_enable");
	CreateTickboxConVariable(CPanel, "gdr_d71.1" ,"gdisasters_revived_hud_oxygen_npc_damage");
	CreateTickboxConVariable(CPanel, "gdr_d72" ,"gdisasters_revived_hud_oxygen_damage");
	
end

local function gDisastersDNC( CPanel )
	local lb1 = AddControlLabel( CPanel, "gdr_d74" )
	local lb2 = AddControlLabel( CPanel, "gdr_d75" )
	lb1:SetTextColor(Color( 0, 47, 255))
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d76"  , "gdisasters_revived_dnc_enabled");
	CreateTickboxConVariable(CPanel, "gdr_d77"  , "gdisasters_revived_dnc_paused");
	CreateTickboxConVariable(CPanel, "gdr_d78"  , "gdisasters_revived_dnc_realtime");
	CreateTickboxConVariable(CPanel, "gdr_d79"  , "gdisasters_revived_dnc_create_light_environment");
	
	CreateSliderConVariable(CPanel, "gdr_d80", 1, 3600, 0, "gdisasters_revived_dnc_length_day" )
	CreateSliderConVariable(CPanel, "gdr_d81", 1, 3600, 0, "gdisasters_revived_dnc_length_night" )

	CreateSliderConVariable(CPanel, "gdr_d82", 1, 6000, 0, "gdisasters_revived_dnc_moon_size" )
	
end

local function gDisastersAddonsCompatibility( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_d83" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d84"  , "gdisasters_revived_spacebuild_enabled");

	local lb = AddControlLabel( CPanel, "gdr_d85" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_d86"  , "gdisasters_revived_stormfox_enabled");
end


--CL MENU 

local function gDisastersADVGraphicsSettings( CPanel )			
	local lb = AddControlLabel( CPanel, "gdr_dcl_1" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateSliderConVariable(CPanel,  "gdr_dcl_2", 1, 4, 0, "gdisasters_revived_graphics_water_quality" );
	CreateSliderConVariable(CPanel,  "gdr_dcl_3", 1, 2, 0, "gdisasters_revived_graphics_water_shader_quality" );
	CreateSliderConVariable(CPanel,  "gdr_dcl_4", 1, 2, 0, "gdisasters_revived_graphics_lava_quality" );
	CreateSliderConVariable(CPanel,   "gdr_dcl_5", 1, 4, 0, "gdisasters_revived_graphics_fog_quality" );

	CreateTickboxConVariable(CPanel, "gdr_dcl_41"  , "gdisasters_revived_graphics_draw_smarttornado_path");
	CreateTickboxConVariable(CPanel, "Enable Volumetric Cloud"  , "gdisasters_revived_volumetric_clouds_enabled");

	local lb2 = AddControlLabel( CPanel, "gdr_dcl_6" )
	lb2:SetTextColor(Color( 255, 0, 0))

	AddComboBox( CPanel, "gdr_dcl_7", {"4x4","8x8","16x16","32x32","64x64","48x48","128x128"}, "gdisasters_revived_graphics_dr_resolution")
	AddComboBox( CPanel, "gdr_dcl_8", {"false", "true"}, "gdisasters_revived_graphics_dr_monochromatic")

	CreateSliderConVariable(CPanel,"gdr_dcl_9", 1, 600, 0, "gdisasters_revived_graphics_dr_maxrenderdistance" );
	CreateSliderConVariable(CPanel,"gdr_dcl_10", 1, 16, 0, "gdisasters_revived_graphics_dr_refreshrate" );
	CreateSliderConVariable(CPanel,"gdr_dcl_11", 1, 16, 0, "gdisasters_revived_graphics_dr_updaterate" );
	
end

local function gDisastersGraphicsSettings( CPanel )

	local lb3 = AddControlLabel( CPanel, "gdr_dcl_12" )
	local lb4 = AddControlLabel( CPanel, "gdr_dcl_13")
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	lb4:SetTextColor(Color( 0, 47, 255))

	CreateTickboxConVariable(CPanel, "gdr_dcl_14"  , "gdisasters_revived_graphics_experimental_overdraw");
	CreateTickboxConVariable(CPanel, "gdr_dcl_15"  , "gdisasters_revived_graphics_shakescreen_enable");
	CreateTickboxConVariable(CPanel, "gdr_dcl_16"  , "gdisasters_revived_graphics_draw_ceiling_effects");
	
	CreateTickboxConVariable(CPanel, "gdr_dcl_17"  , "gdisasters_revived_graphics_enable_ground_particles");
	CreateTickboxConVariable(CPanel, "gdr_dcl_18"  , "gdisasters_revived_graphics_enable_weather_particles");
	CreateTickboxConVariable(CPanel, "gdr_dcl_19"  , "gdisasters_revived_graphics_enable_screen_particles");

	CreateTickboxConVariable(CPanel, "gdr_dcl_20"  , "gdisasters_revived_graphics_enable_manual_number_of_screen_particles");

	CreateSliderConVariable(CPanel, "gdr_dcl_21", 0, 20, 1,"gdisasters_revived_graphics_number_of_screen_particles"  );

end

local function gDisastersHudSettings( CPanel )
	
	local lb = AddControlLabel( CPanel, "gdr_dcl_22")
	local lb2 = AddControlLabel( CPanel, "gdr_dcl_23")
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	lb2:SetTextColor(Color( 0, 47, 255))

	CreateTickboxConVariable(CPanel, "gdr_dcl_24", "gdisasters_revived_hud_enabled");
	
	CreateTickboxConVariable(CPanel, "gdr_dcl_25" ,"gdisasters_revived_hud_temp_effects");
	CreateTickboxConVariable(CPanel, "gdr_dcl_26" ,"gdisasters_revived_hud_temp_vomit");
	CreateTickboxConVariable(CPanel, "gdr_dcl_27" ,"gdisasters_revived_hud_temp_sneeze");
	CreateTickboxConVariable(CPanel, "gdr_dcl_28" ,"gdisasters_revived_hud_underwater_effects");
	CreateTickboxConVariable(CPanel, "gdr_dcl_29" ,"gdisasters_revived_hud_underlava_effects");
	
	CreateSliderConVariable(CPanel, "gdr_dcl_30", 1, 5, 0, "gdisasters_revived_hud_type" );

	AddComboBox( CPanel, "gdr_dcl_31", {"km/h", "mph"}, "gdisasters_revived_hud_windtype")
	AddComboBox( CPanel, "gdr_dcl_32", {"°C", "°F", "°K"}, "gdisasters_revived_hud_temptype")


end


local function gDisastersAudioSettings( CPanel )
	
	local lb = AddControlLabel( CPanel, "gdr_dcl_33" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_dcl_34", 0,1,1, "gdisasters_revived_volume_Light_Wind" );
	CreateSliderConVariable(CPanel, "gdr_dcl_35", 0,1,1, "gdisasters_revived_volume_Moderate_Wind" );
	CreateSliderConVariable(CPanel, "gdr_dcl_36", 0,1,1,"gdisasters_revived_volume_Heavy_Wind" );
	CreateSliderConVariable(CPanel, "gdr_dcl_37", 0,1,1,"gdisasters_revived_volume_soundwave" );
	
	local lb2 =  AddControlLabel( CPanel, "gdr_dcl_38" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_dcl_39", 0,1,1, "gdisasters_revived_volume_hud_heartbeat" );
	CreateSliderConVariable(CPanel, "gdr_dcl_40", 0,1,1, "gdisasters_revived_volume_hud_warning" );
end

hook.Add( "AddToolMenuTabs", "gDisasters_Tab", function()
	spawnmenu.AddToolTab( "gDisasters", "#gDisasters", "icons/gdlogo.png" )
end)

hook.Add( "PopulateToolMenu", "gDisasters_PopulateMenu", function()
	

	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHADSettings", language.GetPhrase("gdr_dadvanced"), "", "", gDisastersSHADVSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHSettings", language.GetPhrase("gdr_dmain"), "", "", gDisastersSHSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersAutospawn", language.GetPhrase("gdr_dautospawn"), "", "", gDisastersAutospawn )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisasterDNC", language.GetPhrase("gdr_dnc"), "", "", gDisastersDNC )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHhud", language.GetPhrase("gdr_dserver_hud"), "", "", gDisastersSHhud )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersAddonsCompatibility", language.GetPhrase("gdr_daddons"), "", "", gDisastersAddonsCompatibility )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHGraphics", language.GetPhrase("gdr_dserver_graphics"), "", "", gDisastersSHGraphics )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersHeatSystemSettings", language.GetPhrase("gdr_dheatsystem"), "", "", gDisastersHeatSystemBeta )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersAudioSettings", language.GetPhrase("gdr_dvolume"), "", "", gDisastersAudioSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersADVGraphicsSettings", language.GetPhrase("gdr_dadvanced_graphics"), "", "", gDisastersADVGraphicsSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersHudSettings", language.GetPhrase("gdr_dhud"), "", "", gDisastersHudSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersGraphicsSettings", language.GetPhrase("gdr_dgraphics"), "", "", gDisastersGraphicsSettings )
	

end );
