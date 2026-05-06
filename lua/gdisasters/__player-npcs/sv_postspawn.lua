function gDisasters_Revived.PostSpawn(ply)
	ply.gDisasters_Revived = {}
	
	local function SetupBodyVariables()
		ply.gDisasters_Revived.Body = {}
		ply.gDisasters_Revived.Body.Temperature = 37
		ply.gDisasters_Revived.Body.Oxygen      = 100

		if GetConVar("gdisasters_revived_hud_temp_enable"):GetInt() <= 0 or GetConVar("gdisasters_revived_hud_temp_value"):GetInt() <= 0 then 
			ply:SetNWFloat("gdr_BodyTemperature", ply.gDisasters_Revived.Body.Temperature)
		elseif GetConVar("gdisasters_revived_hud_oxygen_enable"):GetInt() <= 0 then
			ply:SetNWFloat(gdr_BodyOxygen, ply.gDisasters_Revived.Body.Oxygen)
		end
	
	end
	local function SetupAreaVariables()
		ply.gDisasters_Revived.Area      = {}
		ply.gDisasters_Revived.Area.LocalWind = 0
		ply.gDisasters_Revived.Area.IsOutdoor = false
	
	end
	local function SetupIntesity()
		ply.LavaIntensity = 0
		ply.WaterIntensity = 0
	end

	SetupBodyVariables()
	SetupAreaVariables()	
	SetupIntesity()
	
end
hook.Add( "PlayerInitialSpawn", "gDisasters_Revived_PostSpawn", gDisasters_Revived.PostSpawn )

function gDisasters_Revived.OnSpawn_Reset( ply )
	ply.gDisasters_Revived.Body.Temperature = 37 
	ply.gDisasters_Revived.Body.Oxygen      = 100
	ply.LavaIntensity = 0
	ply.gasmasked=false
	ply.hazsuited=false
	ply.isinfected=false
	ply:StopSound("breathing")
	net.Start( "gdr_net" )        
	net.WriteBit( false )
	net.Send(ply)

	if GetConVar("gdisasters_revived_hud_temp_enable"):GetInt() <= 0 or GetConVar("gdisasters_revived_hud_temp_value"):GetInt() <= 0 then 
		ply:SetNWFloat("gdr_BodyTemperature", ply.gDisasters_Revived.Body.Temperature)
	elseif GetConVar("gdisasters_revived_hud_oxygen_enable"):GetInt() <= 0 then
		ply:SetNWFloat("gdr_BodyOxygen", ply.gDisasters_Revived.Body.Oxygen)
	end
end
hook.Add( "PlayerSpawn", "gDisasters_Revived_OnSpawn_Reset", gDisasters_Revived.OnSpawn_Reset )