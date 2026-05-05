hook.Add( "InitPostEntity", "gDisastersInitPostEvo", function()
	if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 or gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() >= 1 then 

		local oldCleanUpMap = game.CleanUpMap
	
		game.CleanUpMap = function(dontSendToClients, ExtraFilters)
			dontSendToClients = (dontSendToClients != nil and dontSendToClients or false)

			if ( ExtraFilters != nil ) then
				table.insert(ExtraFilters, "env_skypaint")
				table.insert(ExtraFilters, "light_environment")
			else
				ExtraFilters = { "env_skypaint", "light_environment" }
			end

			oldCleanUpMap(dontSendToClients, ExtraFilters)
		end
		gDisasters_Revived:Msg("removed entitys env_skypaint and light_environment")
	
	end

end )

hook.Add( "PostInit", "gDisastersInitFix", function()
	if GetConVar("gdisasters_revived_graphics_atmosphere"):GetInt() >= 1 or gDisasters_Revived.DayNightSystem.InternalVars.Enabled:GetInt() >= 1 then 

		if #ents.FindByClass("env_skypaint")<1 then
			local ent = ents.Create("env_skypaint")
			ent:SetPos(Vector(0,0,0))
			ent:Spawn()
			gDisasters_Revived:Msg("created env_skypaint")
		end

		RunConsoleCommand( "sv_skyname", "painted" )
		gDisasters_Revived:Msg("Changing sv_skyname to painted")

		if ( game.ConsoleCommand ) then
			game.ConsoleCommand( "sv_skyname painted\n" )
			gDisasters_Revived:Msg("finish Changing sv_skyname to painted")
		end

		gDisasters_Revived:Msg("changed sv_skyname to painted")

		gDisasters_Revived:Msg("Setting global var gdsundir")
		local env_sun = ents.FindByClass("env_sun")[1]
		if env_sun then
			local sunDir = env_sun:GetInternalVariable("sun_dir")
			gDisasters_Revived:gDisasters_SetSunDir(sunDir)
		end
		gDisasters_Revived:Msg("Finish")
	end
end)




















































