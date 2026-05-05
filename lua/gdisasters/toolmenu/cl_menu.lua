
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
			net.Start( "gdr_clmenu_vars" );
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
			net.Start( "gdr_clmenu_vars" );
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

	local lb = AddControlLabel( CPanel, "gdr_1" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_2"  , "gdisasters_revived_envdynamicwater_candamageconstraints");
	CreateTickboxConVariable(CPanel, "gdr_3" ,"gdisasters_revived_envtornado_candamageconstraints");
	CreateTickboxConVariable(CPanel, "gdr_4" ,"gdisasters_revived_wind_candamageconstraints");

	local lb3 = AddControlLabel( CPanel, "gdr_5" )
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_6" ,"gdisasters_revived_tvirus_zombie_strength");
	CreateTickboxConVariable(CPanel, "gdr_7" ,"gdisasters_revived_tvirus_nmrih_zombies");
end

local function gDisastersSHADVSettings( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_8")
	local lb2 = AddControlLabel( CPanel, "gdr_9")
	lb:SetTextColor(Color( 255, 0, 0))
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	local lb3 = AddControlLabel( CPanel, "gdr_10")
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_11", 0.1, 0.50, 2, "gdisasters_revived_envtornado_simquality" );
	CreateSliderConVariable(CPanel, "gdr_12", 0.1, 0.50, 2, "gdisasters_revived_envearthquake_simquality" );
	CreateSliderConVariable(CPanel, "gdr_13", 0.1, 0.50, 2, "gdisasters_revived_envdynamicwater_simquality");
	CreateSliderConVariable(CPanel, "gdr_14", 0.1, 0.50, 2, "gdisasters_revived_wind_physics_simquality");

	local lb4 = AddControlLabel( CPanel, "gdr_15" )
	lb4:SetTextColor(Color( 0, 0, 0))
	lb4:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_16" ,"gdisasters_revived_wind_physics_enabled");
	CreateTickboxConVariable(CPanel, "gdr_17" ,"gdisasters_revived_wind_postdamage_nocollide_enabled");
	CreateTickboxConVariable(CPanel, "gdr_18" ,"gdisasters_revived_wind_postdamage_nocollide_basetimeout");
	CreateTickboxConVariable(CPanel, "gdr_19" ,"gdisasters_revived_wind_postdamage_nocollide_basetimeout_spread");
	CreateTickboxConVariable(CPanel, "gdr_20" ,"gdisasters_revived_wind_postdamage_reducemass_enabled");

	local lb41 = AddControlLabel( CPanel, "gdr_21" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_22" ,"gdisasters_revived_envearthquake_change_collision_group");

	local lb41 = AddControlLabel( CPanel, "gdr_23" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_24" ,"gdisasters_revived_volcano_weatherchange");

	CreateSliderConVariable(CPanel, "gdr_25", 0, 10, 2, "gdisasters_revived_volcano_pressure_increase" );
	CreateSliderConVariable(CPanel, "gdr_26", 0, 10, 2, "gdisasters_revived_volcano_pressure_decrease" );

	local lb41 = AddControlLabel( CPanel, "gdr_27" )
	lb41:SetTextColor(Color( 0, 0, 0))
	lb41:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_28" ,"gdisasters_revived_weather_bradiation_damage_props");
	CreateTickboxConVariable(CPanel, "gdr_28.1" ,"gdisasters_revived_weather_bradiation_damage_npcs");

	local lb5 = AddControlLabel( CPanel, "gdr_29" )
	lb5:SetTextColor(Color( 0, 0, 0))
	lb5:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_30" , 0, 10000, 1,"gdisasters_revived_envdynamicwater_level_min");
	CreateSliderConVariable(CPanel, "gdr_31", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_level_max");

	CreateSliderConVariable(CPanel, "gdr_32", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_startlevel");
	CreateSliderConVariable(CPanel, "gdr_33", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_middellevel");
	CreateSliderConVariable(CPanel, "gdr_34", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_endlevel");

	CreateSliderConVariable(CPanel, "gdr_35", 0, 10000, 1 ,"gdisasters_revived_envdynamicwater_b_speed");
	
	local lb6 = AddControlLabel( CPanel, "gdr_36")
	lb6:SetTextColor(Color( 0, 0, 0))
	lb6:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_37" ,"gdisasters_revived_envtornado_manualspeed");
	CreateSliderConVariable(CPanel, "gdr_38", 4, 20, 1, "gdisasters_revived_envtornado_speed" );
	CreateSliderConVariable(CPanel, "gdr_39", 1, 1000, 1, "gdisasters_revived_envtornado_lifetime_min" );
	CreateSliderConVariable(CPanel, "gdr_40", 1, 1000, 1, "gdisasters_revived_envtornado_lifetime_max" );
	CreateSliderConVariable(CPanel, "gdr_41", 0, 5000, 1, "gdisasters_revived_envtornado_damage" );
	
	
end

local function gDisastersSHGraphics( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_42" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_43"  , "gdisasters_revived_graphics_atmosphere");
	CreateTickboxConVariable(CPanel, "gdr_44"  , "gdisasters_revived_graphics_gfx");
	CreateTickboxConVariable(CPanel, "gdr_45"  , "gdisasters_revived_graphics_fog");
	

	local lb2 = AddControlLabel( CPanel, "gdr_46" )
	local lb3 = AddControlLabel( CPanel, "gdr_47" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	lb3:SetTextColor(Color( 0, 47, 255))

	CreateSliderConVariable(CPanel,"gdr_48", 0, 1000, 0,"gdisasters_revived_antilag_maximum_safe_collisions_per_second_per_prop");
	CreateSliderConVariable(CPanel,"gdr_49", 0, 1000, 0,"gdisasters_revived_antilag_post_damage_no_collide_base_time");
	CreateSliderConVariable(CPanel,"gdr_50", 0, 1000, 0,"gdisasters_revived_antilag_maximum_safe_collisions_per_second_average" );

	local lb4 = AddControlLabel( CPanel, "gdr_51" )
	lb4:SetTextColor(Color( 0, 0, 0))
	lb4:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel,"gdr_52", 0, 2, 0,"gdisasters_revived_antilag_mode" );
	CreateTickboxConVariable(CPanel,"gdr_53", "gdisasters_revived_antilag_enabled" );
	
end



local function gDisastersAutospawn( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_54" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_55", 1, 1000, 0, "gdisasters_revived_autospawn_spawn_timer" )
	CreateSliderConVariable(CPanel, "gdr_56", 1, 1000, 0, "gdisasters_revived_autospawn_remove_timer" )
	CreateSliderConVariable(CPanel, "gdr_57", 0, 1000, 0, "gdisasters_revived_autospawn_spawn_chance" )

	AddComboBox( CPanel, "Autospawn Type", {"Disasters", "Weather", "Tornado", "Weather/Disasters"}, "gdisasters_revived_autospawn_type")

	local lb2 = AddControlLabel( CPanel, "gdr_58" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)

	CreateTickboxConVariable(CPanel, "gdr_59"  , "gdisasters_revived_autospawn_getridmaptor");
	CreateTickboxConVariable(CPanel, "gdr_60"  , "gdisasters_revived_autospawn_chat");
	CreateTickboxConVariable(CPanel, "gdr_61"  , "gdisasters_revived_autospawn_enable");

	
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
	

	CreateTickboxConVariable(CPanel, "gdr_88", "gdisasters_revived_heat_system_enabled");
	CreateTickboxConVariable(CPanel, "gdr_87", "gdisasters_revived_graphics_draw_heatsystem_grid");
end

local function gDisastersSHhud( CPanel )

	
	local lb2 = AddControlLabel( CPanel, "gdr_62" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_63" ,"gdisasters_revived_hud_temp_enable");
	CreateTickboxConVariable(CPanel, "gdr_64" ,"gdisasters_revived_hud_temp_breathing");
	CreateTickboxConVariable(CPanel, "gdr_65" ,"gdisasters_revived_hud_temp_damage");
	CreateTickboxConVariable(CPanel, "gdr_65.1" ,"gdisasters_revived_hud_temp_npc_damage");
	CreateTickboxConVariable(CPanel, "gdr_66" ,"gdisasters_revived_hud_temp_player_speed_enable");
	CreateTickboxConVariable(CPanel, "gdr_67" ,"gdisasters_revived_hud_temp_value");

	CreateSliderConVariable(CPanel, "gdr_68", 0, 1000, 0, "gdisasters_revived_hud_temp_player_speed_walk" );
	CreateSliderConVariable(CPanel, "gdr_69", 0, 1000, 0, "gdisasters_revived_hud_temp_player_speed_sprint" );

	local lb3 = AddControlLabel( CPanel, "gdr_70" )
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_71" ,"gdisasters_revived_hud_oxygen_enable");
	CreateTickboxConVariable(CPanel, "gdr_71.1" ,"gdisasters_revived_hud_oxygen_npc_damage");
	CreateTickboxConVariable(CPanel, "gdr_72" ,"gdisasters_revived_hud_oxygen_damage");
	
end

local function gDisastersDNC( CPanel )
	local lb1 = AddControlLabel( CPanel, "gdr_74" )
	local lb2 = AddControlLabel( CPanel, "gdr_75" )
	lb1:SetTextColor(Color( 0, 47, 255))
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_76"  , "gdisasters_revived_dnc_enabled");
	CreateTickboxConVariable(CPanel, "gdr_77"  , "gdisasters_revived_dnc_paused");
	CreateTickboxConVariable(CPanel, "gdr_78"  , "gdisasters_revived_dnc_realtime");
	CreateTickboxConVariable(CPanel, "gdr_79"  , "gdisasters_revived_dnc_create_light_environment");
	
	CreateSliderConVariable(CPanel, "gdr_80", 1, 3600, 0, "gdisasters_revived_dnc_length_day" )
	CreateSliderConVariable(CPanel, "gdr_81", 1, 3600, 0, "gdisasters_revived_dnc_length_night" )

	CreateSliderConVariable(CPanel, "gdr_82", 1, 6000, 0, "gdisasters_revived_dnc_moon_size" )
	
end

local function gDisastersAddonsCompatibility( CPanel )

	local lb = AddControlLabel( CPanel, "gdr_83" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_84"  , "gdisasters_revived_spacebuild_enabled");

	local lb = AddControlLabel( CPanel, "gdr_85" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateTickboxConVariable(CPanel, "gdr_86"  , "gdisasters_revived_stormfox_enabled");
end


--CL MENU 

local function gDisastersADVGraphicsSettings( CPanel )			
	local lb = AddControlLabel( CPanel, "gdr_cl_1" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)

	CreateSliderConVariable(CPanel,  "gdr_cl_2", 1, 4, 0, "gdisasters_revived_graphics_water_quality" );
	CreateSliderConVariable(CPanel,  "gdr_cl_3", 1, 2, 0, "gdisasters_revived_graphics_water_shader_quality" );
	CreateSliderConVariable(CPanel,  "gdr_cl_4", 1, 2, 0, "gdisasters_revived_graphics_lava_quality" );
	CreateSliderConVariable(CPanel,   "gdr_cl_5", 1, 4, 0, "gdisasters_revived_graphics_fog_quality" );

	CreateTickboxConVariable(CPanel, "gdr_cl_41"  , "gdisasters_revived_graphics_draw_smarttornado_path");
	CreateTickboxConVariable(CPanel, "Enable Volumetric Cloud"  , "gdisasters_revived_volumetric_clouds_enabled");

	local lb2 = AddControlLabel( CPanel, "gdr_cl_6" )
	lb2:SetTextColor(Color( 255, 0, 0))

	AddComboBox( CPanel, "gdr_cl_7", {"4x4","8x8","16x16","32x32","64x64","48x48","128x128"}, "gdisasters_revived_graphics_dr_resolution")
	AddComboBox( CPanel, "gdr_cl_8", {"false", "true"}, "gdisasters_revived_graphics_dr_monochromatic")

	CreateSliderConVariable(CPanel,"gdr_cl_9", 1, 600, 0, "gdisasters_revived_graphics_dr_maxrenderdistance" );
	CreateSliderConVariable(CPanel,"gdr_cl_10", 1, 16, 0, "gdisasters_revived_graphics_dr_refreshrate" );
	CreateSliderConVariable(CPanel,"gdr_cl_11", 1, 16, 0, "gdisasters_revived_graphics_dr_updaterate" );
	
end

local function gDisastersGraphicsSettings( CPanel )

	local lb3 = AddControlLabel( CPanel, "gdr_cl_12" )
	local lb4 = AddControlLabel( CPanel, "gdr_cl_13")
	lb3:SetTextColor(Color( 0, 0, 0))
	lb3:SetSize(500, 500)
	lb4:SetTextColor(Color( 0, 47, 255))

	CreateTickboxConVariable(CPanel, "gdr_cl_14"  , "gdisasters_revived_graphics_experimental_overdraw");
	CreateTickboxConVariable(CPanel, "gdr_cl_15"  , "gdisasters_revived_graphics_shakescreen_enable");
	CreateTickboxConVariable(CPanel, "gdr_cl_16"  , "gdisasters_revived_graphics_draw_ceiling_effects");
	
	CreateTickboxConVariable(CPanel, "gdr_cl_17"  , "gdisasters_revived_graphics_enable_ground_particles");
	CreateTickboxConVariable(CPanel, "gdr_cl_18"  , "gdisasters_revived_graphics_enable_weather_particles");
	CreateTickboxConVariable(CPanel, "gdr_cl_19"  , "gdisasters_revived_graphics_enable_screen_particles");

	CreateTickboxConVariable(CPanel, "gdr_cl_20"  , "gdisasters_revived_graphics_enable_manual_number_of_screen_particles");

	CreateSliderConVariable(CPanel, "gdr_cl_21", 0, 20, 1,"gdisasters_revived_graphics_number_of_screen_particles"  );

end

local function gDisastersHudSettings( CPanel )
	
	local lb = AddControlLabel( CPanel, "gdr_cl_22")
	local lb2 = AddControlLabel( CPanel, "gdr_cl_23")
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	lb2:SetTextColor(Color( 0, 47, 255))

	CreateTickboxConVariable(CPanel, "gdr_cl_24", "gdisasters_revived_hud_enabled");
	
	CreateTickboxConVariable(CPanel, "gdr_cl_25" ,"gdisasters_revived_hud_temp_effects");
	CreateTickboxConVariable(CPanel, "gdr_cl_26" ,"gdisasters_revived_hud_temp_vomit");
	CreateTickboxConVariable(CPanel, "gdr_cl_27" ,"gdisasters_revived_hud_temp_sneeze");
	CreateTickboxConVariable(CPanel, "gdr_cl_28" ,"gdisasters_revived_hud_underwater_effects");
	CreateTickboxConVariable(CPanel, "gdr_cl_29" ,"gdisasters_revived_hud_underlava_effects");
	
	CreateSliderConVariable(CPanel, "gdr_cl_30", 1, 5, 0, "gdisasters_revived_hud_type" );

	AddComboBox( CPanel, "gdr_cl_31", {"km/h", "mph"}, "gdisasters_revived_hud_windtype")
	AddComboBox( CPanel, "gdr_cl_32", {"°C", "°F", "°K"}, "gdisasters_revived_hud_temptype")


end


local function gDisastersAudioSettings( CPanel )
	
	local lb = AddControlLabel( CPanel, "gdr_cl_33" )
	lb:SetTextColor(Color( 0, 0, 0))
	lb:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_cl_34", 0,1,1, "gdisasters_revived_volume_Light_Wind" );
	CreateSliderConVariable(CPanel, "gdr_cl_35", 0,1,1, "gdisasters_revived_volume_Moderate_Wind" );
	CreateSliderConVariable(CPanel, "gdr_cl_36", 0,1,1,"gdisasters_revived_volume_Heavy_Wind" );
	CreateSliderConVariable(CPanel, "gdr_cl_37", 0,1,1,"gdisasters_revived_volume_soundwave" );
	
	local lb2 =  AddControlLabel( CPanel, "gdr_cl_38" )
	lb2:SetTextColor(Color( 0, 0, 0))
	lb2:SetSize(500, 500)
	
	CreateSliderConVariable(CPanel, "gdr_cl_39", 0,1,1, "gdisasters_revived_volume_hud_heartbeat" );
	CreateSliderConVariable(CPanel, "gdr_cl_40", 0,1,1, "gdisasters_revived_volume_hud_warning" );
end

hook.Add( "AddToolMenuTabs", "gDisasters_Tab", function()
	spawnmenu.AddToolTab( "gDisasters", "#gDisasters", "icons/gdlogo.png" )
end)

hook.Add( "PopulateToolMenu", "gDisasters_PopulateMenu", function()
	

	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHADSettings", language.GetPhrase("gdr_advanced"), "", "", gDisastersSHADVSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHSettings", language.GetPhrase("gdr_main"), "", "", gDisastersSHSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersAutospawn", language.GetPhrase("gdr_autospawn"), "", "", gDisastersAutospawn )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisasterDNC", language.GetPhrase("gdr_nc"), "", "", gDisastersDNC )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHhud", language.GetPhrase("gdr_server_hud"), "", "", gDisastersSHhud )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersAddonsCompatibility", language.GetPhrase("gdr_addons"), "", "", gDisastersAddonsCompatibility )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersSHGraphics", language.GetPhrase("gdr_server_graphics"), "", "", gDisastersSHGraphics )
	spawnmenu.AddToolMenuOption( "gDisasters", "Shared", "gDisastersHeatSystemSettings", language.GetPhrase("gdr_heatsystem"), "", "", gDisastersHeatSystemBeta )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersAudioSettings", language.GetPhrase("gdr_volume"), "", "", gDisastersAudioSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersADVGraphicsSettings", language.GetPhrase("gdr_advanced_graphics"), "", "", gDisastersADVGraphicsSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersHudSettings", language.GetPhrase("gdr_hud"), "", "", gDisastersHudSettings )
	spawnmenu.AddToolMenuOption( "gDisasters", "Client", "gDisastersGraphicsSettings", language.GetPhrase("gdr_graphics"), "", "", gDisastersGraphicsSettings )
	

end );
