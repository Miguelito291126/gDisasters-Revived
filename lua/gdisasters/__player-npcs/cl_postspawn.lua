
function gDisasters_Revived_PostSpawnCL()
	
	LocalPlayer().gDisasters_Revived = {}
	
	local function gDisasters_Revived_SetupHUDMISC()
		LocalPlayer().gDisasters_Revived.HUD = {}
		LocalPlayer().gDisasters_Revived.HUD.NextWarningSoundTime = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.NextHeartSoundTime   = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.NextVomitTime        = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.NextVomitBloodTime   = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.VomitIntensity       = 0
		LocalPlayer().gDisasters_Revived.HUD.BloodVomitIntensity  = 0
		LocalPlayer().gDisasters_Revived.HUD.NextSneezeTime       = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.NextSneezeBigTime  = CurTime()
		LocalPlayer().gDisasters_Revived.HUD.SneezeIntensity       = 0
		LocalPlayer().gDisasters_Revived.HUD.SneezeBigIntensity  = 0
	end
	
	local function gDisasters_Revived_SetupCLConvars()
	
		--hud
		CreateConVar( "gdisasters_revived_hud_enabled", 1, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_type", 1, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_windtype", "km/h", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_temptype", "°C", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_temp_effects", "1", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_temp_vomit", "1", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_temp_sneeze", "1", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_underwater_effects", "1", {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_hud_underlava_effects", "1", {FCVAR_ARCHIVE}	, "" )

		--graphics
		CreateConVar( "gdisasters_revived_graphics_fog_quality", 4, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_graphics_water_quality", 2, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_graphics_water_shader_quality", 1, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_graphics_lava_quality", 2, {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_dr_resolution", "48x48", {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_dr_monochromatic", "false", {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_dr_maxrenderdistance", 500, {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_dr_refreshrate", 2, {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_dr_updaterate", 2, {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_draw_ceiling_effects", 0, {FCVAR_ARCHIVE}	, "")
		CreateConVar( "gdisasters_revived_graphics_enable_ground_particles", 1, {FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_enable_weather_particles", 1, {FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_enable_screen_particles", 1, {FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_enable_manual_number_of_screen_particles", 1, {FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_number_of_screen_particles", 1, {FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_shakescreen_enable", 1,{FCVAR_ARCHIVE}, "")
		CreateConVar( "gdisasters_revived_graphics_experimental_overdraw", 1, {FCVAR_ARCHIVE}, "sexy " )
		CreateConVar( "gdisasters_revived_graphics_draw_smarttornado_path", 0, {FCVAR_ARCHIVE}, "" )
		CreateConVar( "gdisasters_revived_graphics_draw_heatsystem_grid", 0, {FCVAR_ARCHIVE}, "" )


		--sounds
		CreateConVar( "gdisasters_revived_volume_hud_heartbeat", 0.1, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_volume_hud_warning", 0.1, {FCVAR_ARCHIVE}	, "" )
		CreateConVar( "gdisasters_revived_volume_soundwave", 1, {FCVAR_ARCHIVE}, " " )
		CreateConVar( "gdisasters_revived_volume_Light_Wind", 1, {FCVAR_ARCHIVE}, " " )
		CreateConVar( "gdisasters_revived_volume_Moderate_Wind", 1, {FCVAR_ARCHIVE}, " " )
		CreateConVar( "gdisasters_revived_volume_Heavy_Wind", 1, {FCVAR_ARCHIVE}, " " )

		--weather
		CreateConVar( "gdisasters_revived_volumetric_clouds_enabled", 0, {FCVAR_ARCHIVE}, " " )
	
	end

	local function gDisasters_Revived_SetupFOGVars()
		LocalPlayer().gDisasters_Revived.Fog = {}
		LocalPlayer().gDisasters_Revived.Fog.Data   = {}
		LocalPlayer().gDisasters_Revived.Fog.Parent = false
		LocalPlayer().gDisasters_Revived.Fog.OQ     = false
		LocalPlayer().gDisasters_Revived.Fog.Setup  = false
		LocalPlayer().gDisasters_Revived.Fog.NextEmitTime = CurTime()
		local data = {}
			data.Color = Color(0,0,0)
			data.DensityCurrent = 0
			data.DensityMax     = 0
			data.DensityMin     = 0
			data.EndMax         = 0
			data.EndMin         = 0
			data.EndMinCurrent  = 0
			data.EndMaxCurrent  = 0       		
		LocalPlayer().gDisasters_Revived.Fog.Data = data
		
	
	end
	
	local function gDisasters_Revived_SetupGFXVars()
		LocalPlayer().gDisasters_Revived.GFX = {}
		LocalPlayer().gDisasters_Revived.GFX.Effect = "none"
		LocalPlayer().gDisasters_Revived.GFX.Parent = false
	end
	
	local function gDisasters_Revived_SetupOutsideVars()
		LocalPlayer().gDisasters_Revived.Outside = {}
		LocalPlayer().gDisasters_Revived.Outside.IsOutside     = false
		LocalPlayer().gDisasters_Revived.Outside.OutsideFactor = 0
		
	
	
	end

	local function gDisasters_Revived_SetupIntesity()
		LocalPlayer().LavaIntensity = 0
		LocalPlayer().WaterIntensity = 0
	end

	local function gDisasters_Revived_SetupSound()
		LocalPlayer().Sounds = {}
	end

	gDisasters_Revived_SetupOutsideVars()
	gDisasters_Revived_SetupHUDMISC()	
	gDisasters_Revived_SetupFOGVars()
	gDisasters_Revived_SetupCLConvars()
	gDisasters_Revived_SetupGFXVars()
	gDisasters_Revived_SetupIntesity()
	gDisasters_Revived_SetupSound()
end
hook.Add( "InitPostEntity", "gDisasters_Revived_PostSpawnCL", gDisasters_Revived_PostSpawnCL)
