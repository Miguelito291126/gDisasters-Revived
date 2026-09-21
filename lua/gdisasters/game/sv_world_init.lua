hook.Add( "PostInit", "gDisastersRevivedInitFix", function()
	if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 or gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() >= 1 then 

		if #ents.FindByClass("env_skypaint")<1 then
			local ent = ents.Create("env_skypaint")
			ent:SetPos(Vector(0,0,0))
			ent:Spawn()
			gDisasters_Revived.Msg("created env_skypaint")
		end

		RunConsoleCommand( "sv_skyname", "painted" )
		gDisasters_Revived.Msg("Changing sv_skyname to painted")

		if ( game.ConsoleCommand ) then
			game.ConsoleCommand( "sv_skyname painted\n" )
			gDisasters_Revived.Msg("finish Changing sv_skyname to painted")
		end

		gDisasters_Revived.Msg("changed sv_skyname to painted")

		gDisasters_Revived.Msg("Setting global var gdsundir")
		local env_sun = ents.FindByClass("env_sun")[1]
		if env_sun then
			local sunDir = env_sun:GetInternalVariable("sun_dir")
			gDisasters_Revived.SetSunDir(sunDir)
		end
		gDisasters_Revived.Msg("Finish")
	end
end)

function gDisasters_Revived.CleanMapComplete()
    if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 or gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() >= 1 then 
        local skypaints = ents.FindByClass("env_skypaint")
        for _, ent in pairs(skypaints) do
            ent:Remove()
            MsgC("Removed entity: " .. tostring(ent))
        end
        
        local lights = ents.FindByClass("light_environment")
        for _, ent in pairs(lights) do
            ent:Remove()
            MsgC("Removed entity: " .. tostring(ent))
        end
    end
end

hook.Add("InitPostEntity", "gDisastersRevivedCleanMap", gDisasters_Revived.CleanMapComplete)
