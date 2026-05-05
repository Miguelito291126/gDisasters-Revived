--DNC System

gDisasters_Revived.DayNightSystem        = {}
gDisasters_Revived.DayNightSystem.InternalVars = {}

gDisasters_Revived.DayNightSystem.InternalVars.Enabled = GetConVar( "gdisasters_revived_dnc_enabled", "0", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.RealTime = GetConVar( "gdisasters_revived_dnc_realtime", "0", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.Paused = GetConVar( "gdisasters_revived_dnc_paused", "0", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.Length_Day = GetConVar( "gdisasters_revived_dnc_length_day", "600", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.Length_Night = GetConVar( "gdisasters_revived_dnc_length_night", "600", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.MoonSize = GetConVar( "gdisasters_revived_dnc_moon_size", "3000", {FCVAR_ARCHIVE}, "" )
gDisasters_Revived.DayNightSystem.InternalVars.Createlight_environment = GetConVar( "gdisasters_revived_dnc_create_light_environment", "1", {FCVAR_ARCHIVE}, "" )

gDisasters_Revived.DayNightSystem.InternalVars.time = {}

gDisasters_Revived.DayNightSystem.InternalVars.time.Noon = 12
gDisasters_Revived.DayNightSystem.InternalVars.time.MidNight = 0
gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start = 4
gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End = 6.5
gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start = 19
gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End = 20.5

gDisasters_Revived.DayNightSystem.InternalVars.Style_Low	= string.byte( 'a' )
gDisasters_Revived.DayNightSystem.InternalVars.Style_High = string.byte( 'm' )

gDisasters_Revived.DayNightSystem.InternalVars.Night	= 0
gDisasters_Revived.DayNightSystem.InternalVars.Dawn = 1
gDisasters_Revived.DayNightSystem.InternalVars.Day = 2
gDisasters_Revived.DayNightSystem.InternalVars.Dusk = 3

gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint = {}
gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day =
{		
	TopColor		= Vector( 0.2, 0.49, 1 ),
	BottomColor		= Vector( 0.8, 1, 1 ),
	FadeBias		= 1,
	HDRScale		= 0.26,
	StarScale 		= 1.84,
	StarFade		= 1.5,	-- Do not change!
	StarSpeed 		= 0.02,
	DuskScale		= 1,
	DuskIntensity	= 1,
	DuskColor		= Vector( 1, 0.2, 0 ),
	SunColor		= Vector( 0.83, 0.45, 0.11 ),
	SunSize			= 0.34,
}
gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dusk = 
{
	TopColor		= Vector( 0.24, 0.15, 0.08 ),
	BottomColor		= Vector( .4, 0.07, 0 ),
	FadeBias		= 1,
	HDRScale		= 0.36,
	StarScale		= 1.50,
	StarFade		= 5.0,	-- Do not change!
	StarSpeed 		= 0.01,
	DuskScale		= 1,
	DuskIntensity	= 1.94,
	DuskColor		= Vector( 0.69, 0.22, 0.02 ),
	SunColor		= Vector( 0.90, 0.30, 0.00 ),
	SunSize			= 0.44,
}
gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dawn = 
{
	TopColor		= Vector( 0.2, 0.5, 1 ),
	BottomColor		= Vector( 0.46, 0.65, 0.49 ),
	FadeBias		= 1,
	HDRScale		= 0.26,
	StarScale 		= 1.84,
	StarFade		= 0.0,	-- Do not change!
	StarSpeed 		= 0.02,
	DuskScale		= 1,
	DuskIntensity	= 1,
	DuskColor		= Vector( 1, 0.2, 0 ),
	SunColor		= Vector( 0.2, 0.1, 0 ),
	SunSize			= 2,
}
gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Night = 
{
	TopColor		= Vector( 0.00, 0.00, 0.00 ),
	BottomColor		= Vector( 0.05, 0.05, 0.11 ),
	FadeBias		= 0.1,
	HDRScale		= 0.19,
	StarScale		= 1.50,
	StarFade		= 5.0,	-- Do not change!
	StarSpeed 		= 0.01,
	DuskScale		= 0,
	DuskIntensity	= 0,
	DuskColor		= Vector( 1, 0.36, 0 ),
	SunColor		= Vector( 0.83, 0.45, 0.11 ),
	SunSize			= 0.0,
}
gDisasters_Revived.DayNightSystem.InternalVars.Fog = {}

gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dusk = 
{
	FogStart = 0.0,
	FogEnd = 35000.0,
	FogDensity = 0.3,
	FogColor = Vector( 1.00, 0.63, 0.00 )
}

gDisasters_Revived.DayNightSystem.InternalVars.Fog.Day = 
{
	FogStart = 0.0,
	FogEnd = 35000.0,
	FogDensity = 0.9,
	FogColor = Vector( 0.6, 0.7, 0.8 )
}

gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dawn = 
{
	FogStart = 0.0,
	FogEnd = 35000.0,
	FogDensity = 0.3,
	FogColor = Vector( 1.00, 0.63, 0.00)
}

gDisasters_Revived.DayNightSystem.InternalVars.Fog.Night = 
{
	FogStart = 0.0,
	FogEnd = 35000.0,
	FogDensity = 0.9,
	FogColor = Vector( 0, 0, 0 )
}

gDisasters_Revived.DayNightSystem.Time = 6.5
gDisasters_Revived.DayNightSystem.OldSkyName = "unknown"
gDisasters_Revived.DayNightSystem.LastPeriod = gDisasters_Revived.DayNightSystem.InternalVars.Night
gDisasters_Revived.DayNightSystem.initEntities = false
gDisasters_Revived.DayNightSystem.Paused = false

gDisasters_Revived.DayNightSystem.Initialize = function()
	gDisasters_Revived.DayNightSystem.OldSkyName = GetConVar("sv_skyname"):GetString();

	if gDisasters_Revived.Is3DSkybox() then
		print("this have 3D skybox")
	else
		print("this don't have 3D skybox")
	end

	hook.Add("Think", "gDisasters_Revived_dnc_think", gDisasters_Revived.DayNightSystem.Think)
end
hook.Add("Initialize", "gDisasters_Revived_dnc_initialize", gDisasters_Revived.DayNightSystem.Initialize)

gDisasters_Revived.DayNightSystem.LightStyle = function(style, force)

	if (CLIENT) then return end

	if ( tostring( gDisasters_Revived.DayNightSystem.LastStyle ) == tostring( style ) and (force == nil or force == false) ) then return end

	if ( IsValid( gDisasters_Revived.DayNightSystem.LightEnvironment ) ) then

		gDisasters_Revived.DayNightSystem.LightEnvironment:Fire( "FadeToPattern", tostring( style ) )

	else
		
		engine.LightStyle( 0, style )
	
		timer.Simple( 0.1, function()
		
			net.Start( "gdr_maplight_cl" )
			net.Broadcast()
		
		end )
		
	end

	gDisasters_Revived.DayNightSystem.LastStyle = style;

end

gDisasters_Revived.DayNightSystem.initEntities_Function = function()

	if (SERVER) then

		gDisasters_Revived.DayNightSystem.LightEnvironment = ents.FindByClass( "light_environment" )[1]
		gDisasters_Revived.DayNightSystem.EnvSun = ents.FindByClass( "env_sun" )[1]
		gDisasters_Revived.DayNightSystem.EnvSkyPaint = ents.FindByClass( "env_skypaint" )[1]
		gDisasters_Revived.DayNightSystem.EnvFogController = ents.FindByClass( "env_fog_controller" )[1]
		gDisasters_Revived.DayNightSystem.RelayDawn = ents.FindByName( "dawn" )[1]
		gDisasters_Revived.DayNightSystem.RelayDusk = ents.FindByName( "dusk" )[1]

		gDisasters_Revived.DayNightSystem.Fog = ents.Create("gdr_fog")
		gDisasters_Revived.DayNightSystem.Fog:Spawn()
		gDisasters_Revived.DayNightSystem.Fog:Activate()

		if !IsValid(gDisasters_Revived.DayNightSystem.EnvFogController) then
			gDisasters_Revived.DayNightSystem.EnvFogController = ents.Create("env_fog_controller")
			gDisasters_Revived.DayNightSystem.EnvFogController:Spawn()
			gDisasters_Revived.DayNightSystem.EnvFogController:Activate()
		end

		if IsValid(gDisasters_Revived.DayNightSystem.EnvSun) then
			gDisasters_Revived.DayNightSystem.EnvSun:SetKeyValue( "sun_dir", "1 0 0" )
		else
			gDisasters_Revived.DayNightSystem.EnvSun = ents.Create("env_sun")
			gDisasters_Revived.DayNightSystem.EnvSun:Spawn()
			gDisasters_Revived.DayNightSystem.EnvSun:Activate()
		end

		if IsValid( gDisasters_Revived.DayNightSystem.LightEnvironment ) then
			gDisasters_Revived.DayNightSystem.LightStyle( "a", true )
		else
			if gDisasters_Revived.DayNightSystem.InternalVars.Createlight_environment:GetInt() <= 0 then
				gDisasters_Revived.DayNightSystem.InternalVars.Style_Low = string.byte( "b" )
				gDisasters_Revived.DayNightSystem.LightStyle( "b", true )
			else
				gDisasters_Revived.DayNightSystem.LightEnvironment = ents.Create("light_environment")
				gDisasters_Revived.DayNightSystem.LightEnvironment:Spawn()
				gDisasters_Revived.DayNightSystem.LightEnvironment:Activate()
			end
		end

		if IsValid( gDisasters_Revived.DayNightSystem.EnvSkyPaint )  then
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarTexture( "skybox/starfield" )
		else
			gDisasters_Revived.DayNightSystem.EnvSkyPaint =  ents.Create("env_skypaint")
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:Spawn()
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:Activate()
		end

		gDisasters_Revived.DayNightSystem.initEntities = true
	end
	if (CLIENT) then
		gDisasters_Revived.DayNightSystem.Fog = g_Fog
	end
end

gDisasters_Revived.DayNightSystem.Think = function()
	if gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() < 1 then return end
	if ( !gDisasters_Revived.DayNightSystem.initEntities ) then gDisasters_Revived.DayNightSystem.initEntities_Function() end

	local timeLen = 3600;
	if (gDisasters_Revived.DayNightSystem.Time > gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start or gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End) then
		timeLen = gDisasters_Revived.DayNightSystem.InternalVars.Length_Night:GetInt();
	else
		timeLen = gDisasters_Revived.DayNightSystem.InternalVars.Length_Day:GetInt();
	end

	if ( !gDisasters_Revived.DayNightSystem.Paused and gDisasters_Revived.DayNightSystem.InternalVars.Paused:GetInt() <= 0 ) then
		if ( gDisasters_Revived.DayNightSystem.InternalVars.RealTime:GetInt() <= 0 ) then
			gDisasters_Revived.DayNightSystem.Time = gDisasters_Revived.DayNightSystem.Time + ( 24 / timeLen ) * FrameTime();
			if ( gDisasters_Revived.DayNightSystem.Time > 24 ) then
				gDisasters_Revived.DayNightSystem.Time = 0;
			end
		else
			gDisasters_Revived.DayNightSystem.Time = gDisasters_Revived.DayNightSystem.GetRealTime();
		end
	end

	-- since our dawn/dusk periods last several hours find the mid point of them
	local dawnMidPoint = ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End + gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ) / 2;
	local duskMidPoint = ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End + gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start ) / 2;

	-- dawn/dusk/night events
	if ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End and IsValid( gDisasters_Revived.DayNightSystem.EnvSun ) ) then
		if ( gDisasters_Revived.DayNightSystem.LastPeriod != gDisasters_Revived.DayNightSystem.InternalVars.Night ) then
			gDisasters_Revived.DayNightSystem.EnvSun:Fire( "TurnOff", "", 0 );
			gDisasters_Revived.DayNightSystem.LastPeriod = gDisasters_Revived.DayNightSystem.InternalVars.Night;
		end

	elseif ( gDisasters_Revived.DayNightSystem.Time >= duskMidPoint ) then
		if ( gDisasters_Revived.DayNightSystem.LastPeriod != gDisasters_Revived.DayNightSystem.InternalVars.Dusk ) then
			if ( IsValid( gDisasters_Revived.DayNightSystem.RelayDusk ) ) then
				gDisasters_Revived.DayNightSystem.RelayDusk:Fire( "Trigger", "" );
			end
			if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSkyPaint ) ) then
				gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarTexture( "skybox/starfield" );	
			end
			gDisasters_Revived.DayNightSystem.LastPeriod = gDisasters_Revived.DayNightSystem.InternalVars.Dusk;
		end

	elseif ( gDisasters_Revived.DayNightSystem.Time >= dawnMidPoint ) then
		if ( gDisasters_Revived.DayNightSystem.LastPeriod != gDisasters_Revived.DayNightSystem.InternalVars.Dawn ) then
			if ( IsValid( gDisasters_Revived.DayNightSystem.RelayDawn ) ) then
				gDisasters_Revived.DayNightSystem.RelayDawn:Fire( "Trigger", "" );
			end
			if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSkyPaint ) ) then
				gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day.StarFade = 0;
			end
			gDisasters_Revived.DayNightSystem.LastPeriod = gDisasters_Revived.DayNightSystem.InternalVars.Dawn;
		end

	elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start and IsValid( gDisasters_Revived.DayNightSystem.EnvSun ) ) then
		if ( gDisasters_Revived.DayNightSystem.LastPeriod != gDisasters_Revived.DayNightSystem.InternalVars.Day ) then
			gDisasters_Revived.DayNightSystem.EnvSun:Fire( "TurnOn", "", 0 );
			gDisasters_Revived.DayNightSystem.LastPeriod = gDisasters_Revived.DayNightSystem.InternalVars.Day;
		end

	end

	-- light_environment
	local lightfrac = 0;

	if ( gDisasters_Revived.DayNightSystem.Time >= dawnMidPoint and gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Noon ) then
		lightfrac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - dawnMidPoint ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Noon - dawnMidPoint ), 0, 1 );
	elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Noon and gDisasters_Revived.DayNightSystem.Time < duskMidPoint ) then
		lightfrac = 1 - math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Noon ) / ( duskMidPoint - gDisasters_Revived.DayNightSystem.InternalVars.time.Noon ), 1, 0 );
	end

	local style = string.char( math.floor( Lerp( lightfrac, gDisasters_Revived.DayNightSystem.InternalVars.Style_Low, gDisasters_Revived.DayNightSystem.InternalVars.Style_High ) + 0.5 ) );

	gDisasters_Revived.DayNightSystem.LightStyle( style );

	-- env_sun
	if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSun ) ) then
		if ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start and gDisasters_Revived.DayNightSystem.Time <= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End ) then
			local sunfrac = 1 - ( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ) );
			local angle = Angle( 180 * sunfrac, 15, 0 );
			gDisasters_Revived.SetSunDir(gDisasters_Revived.convert_AngleToVector(-angle))

			gDisasters_Revived.DayNightSystem.EnvSun:SetKeyValue( "sun_dir", tostring(gDisasters_Revived.GetSunDir()) );
		end
	end

	--gdr_fog

	

	if ( IsValid( gDisasters_Revived.DayNightSystem.Fog ) ) then
		if (CLIENT) then
			local cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Night;
			local next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Night;
			local frac = 0;
			local ease = 0.3;

			if ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start and gDisasters_Revived.DayNightSystem.Time < dawnMidPoint ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Night;
				next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dawn;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ) / ( dawnMidPoint - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= dawnMidPoint and gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dawn;
				next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Day;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - dawnMidPoint ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End - dawnMidPoint ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start and gDisasters_Revived.DayNightSystem.Time < duskMidPoint ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Day;
				next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dusk;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start ) / ( duskMidPoint - gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= duskMidPoint and gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Dusk;
				next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Night;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - duskMidPoint ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End - duskMidPoint ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End and gDisasters_Revived.DayNightSystem.Time <= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Day;
				next = gDisasters_Revived.DayNightSystem.InternalVars.Fog.Day;
			end

			gDisasters_Revived.DayNightSystem.Fog:SetFogStart(Lerp( frac, cur.FogStart, next.FogStart ))
			gDisasters_Revived.DayNightSystem.Fog:SetFogEnd(Lerp( frac, cur.FogEnd, next.FogEnd ))
			gDisasters_Revived.DayNightSystem.Fog:SetFogDensity(Lerp( frac, cur.FogDensity, next.FogDensity ))
			gDisasters_Revived.DayNightSystem.Fog:SetFogColor(LerpVector( frac, cur.FogColor, next.FogColor ))
    		
		end	
	end

	-- env_skypaint
	if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSkyPaint ) ) then

		if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSun ) ) then
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetSunNormal( gDisasters_Revived.DayNightSystem.EnvSun:GetInternalVariable( "m_vDirection" ) );
		end

		if (SERVER) then

			local cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Night;
			local next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Night;
			local frac = 0;
			local ease = 0.3;

			if ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start and gDisasters_Revived.DayNightSystem.Time < dawnMidPoint ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Night;
				next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dawn;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ) / ( dawnMidPoint - gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_Start ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= dawnMidPoint and gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dawn;
				next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - dawnMidPoint ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End - dawnMidPoint ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start and gDisasters_Revived.DayNightSystem.Time < duskMidPoint ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day;
				next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dusk;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start ) / ( duskMidPoint - gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_Start ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= duskMidPoint and gDisasters_Revived.DayNightSystem.Time < gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Dusk;
				next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Night;
				frac = math.EaseInOut( ( gDisasters_Revived.DayNightSystem.Time - duskMidPoint ) / ( gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End - duskMidPoint ), ease, ease );
			elseif ( gDisasters_Revived.DayNightSystem.Time >= gDisasters_Revived.DayNightSystem.InternalVars.time.Dawn_End and gDisasters_Revived.DayNightSystem.Time <= gDisasters_Revived.DayNightSystem.InternalVars.time.Dusk_End ) then
				cur = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day;
				next = gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day;
			end

			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetTopColor( LerpVector( frac, cur.TopColor, next.TopColor ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetBottomColor( LerpVector( frac, cur.BottomColor, next.BottomColor ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetSunColor( LerpVector( frac, cur.SunColor, next.SunColor ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetDuskColor( LerpVector( frac, cur.DuskColor, next.DuskColor ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetFadeBias( Lerp( frac, cur.FadeBias, next.FadeBias ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetHDRScale( Lerp( frac, cur.HDRScale, next.HDRScale ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetDuskScale( Lerp( frac, cur.DuskScale, next.DuskScale ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetDuskIntensity( Lerp( frac, cur.DuskIntensity, next.DuskIntensity ) );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetSunSize( (Lerp( frac, cur.SunSize, next.SunSize )) );

			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarFade( next.StarFade );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarScale( next.StarScale );
			gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarSpeed( next.StarSpeed );
		end
	end
end

gDisasters_Revived.DayNightSystem.TogglePause = function()
	gDisasters_Revived.DayNightSystem.Paused = !gDisasters_Revived.DayNightSystem.Paused
end

gDisasters_Revived.DayNightSystem.SetTime = function(time)
	gDisasters_Revived.DayNightSystem.Time = math.Clamp( time, 0, 24 );

	if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSun ) ) then
		gDisasters_Revived.DayNightSystem.EnvSun:SetKeyValue( "sun_dir", "1 0 0" );
	end

	if ( IsValid( gDisasters_Revived.DayNightSystem.EnvSkyPaint ) ) then
		gDisasters_Revived.DayNightSystem.EnvSkyPaint:SetStarTexture( "skybox/starfield" );
		gDisasters_Revived.DayNightSystem.InternalVars.SkyPaint.Day.StarFade = 0;
	end
end

gDisasters_Revived.DayNightSystem.GetRealTime = function()

	local t = os.date( "*t" );

	return t.hour + (t.min / 60) + (t.sec / 3600);

end

gDisasters_Revived.DayNightSystem.GetTime = function()

	return (gDisasters_Revived.DayNightSystem.InternalVars.RealTime:GetInt() <= 0 and gDisasters_Revived.DayNightSystem.Time or gDisasters_Revived.DayNightSystem.GetRealTime());

end

gDisasters_Revived.DayNightSystem.CalcView = function(pl, pos, ang, fov, nearZ, farZ)
	LastNearZ = nearZ;
	LastFarZ = farZ;
end

gDisasters_Revived.DayNightSystem.RenderScene = function(origin, angles, fov)
	LastSceneOrigin = origin;
	LastSceneAngles = angles;
end

local moonAlpha = 0;
local moonMat = Material( "atmosphere/moon/9" );
moonMat:SetInt( "$additive", 0 );
moonMat:SetInt( "$translucent", 0 );

gDisasters_Revived.DayNightSystem.RenderMoon = function()

	if gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() < 1 then return end

	time = gDisasters_Revived.DayNightSystem.Time
	night = time < 4 or time > 20.5
	
	if ( night ) then

		local mul;

		if ( time > 20.5 ) then

			mul = 1 - ( time + 4 ) / 8;

		else

			mul = 1 - ( time - 4 ) / 8;

		end

		local angle = Angle( 180 * mul, 15, 0 );
		gDisasters_Revived.SetMoonDir(gDisasters_Revived.convert_AngleToVector(angle))

        local moonPos = gDisasters_Revived.GetMoonDir() * ( LastFarZ * 0.900 );
        local moonNormal = ( vector_origin - moonPos ):GetNormal();

        moonAlpha = Lerp( FrameTime() * 1, moonAlpha, 255 );
	
        local moonSize = gDisasters_Revived.DayNightSystem.InternalVars.MoonSize:GetFloat();

        cam.Start3D(vector_origin, LastSceneAngles);
            render.OverrideDepthEnable( true, false );
            render.SetMaterial( moonMat );
            render.DrawQuadEasy( moonPos, moonNormal, moonSize, moonSize, Color( 255, 255, 255, moonAlpha ), -180 );
            render.OverrideDepthEnable( false, false );
        cam.End3D();

	else

		if ( moonAlpha != 0 ) then

			moonAlpha = 0;

		end

	end
end