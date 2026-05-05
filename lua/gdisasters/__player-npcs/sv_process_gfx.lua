function gDisasters_Revived_CreateFog(ply, parent_entity, fogdata, override_quality)
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end
	net.Start("gdr_createfog")
	net.WriteEntity(parent_entity)
	net.WriteBool(override_quality)
	net.WriteTable(fogdata)
	net.Send(ply)

end

function gDisasters_Revived_CreateGlobalFog(parent_entity, data, override_quality)
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived_CreateFog(v, parent_entity, data, override_quality)
		
	end

end

function gDisasters_Revived_ResetOutsideFactor(ply) 
	
	net.Start("gdr_resetoutsidefactor")
	net.Send(ply)

end

function gDisasters_Revived_ResetGlobalOutsideFactor()
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived_ResetOutsideFactor(v)
	end
	

end

function gDisasters_Revived_RemoveGlobalFog()
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end

	net.Start("gdr_removegfxfog")
	net.WriteBool(true)
	net.WriteBool(false)
	net.Broadcast()

		
end

function gDisasters_Revived_RemoveGlobalGFX()
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end

	net.Start("gdr_removegfxfog")
	net.WriteBool(false)
	net.WriteBool(true)
	net.Broadcast()

	

end



function gDisasters_Revived_CreateGFX(ply, parent_entity, effect)
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end

	net.Start("gdr_creategfx")
	net.WriteEntity(parent_entity)
	net.WriteString(effect)
	net.Send(ply)
		
		
end

function gDisasters_Revived_CreateGlobalGFX(effect, parent_entity)
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived_CreateGFX(v, parent_entity, effect)
	
	end

end

