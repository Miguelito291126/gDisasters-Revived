function gDisasters_Revived.CreateFog(ply, parent_entity, fogdata, override_quality)
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end
	net.Start("gdr_createfog")
	net.WriteEntity(parent_entity)
	net.WriteBool(override_quality)
	net.WriteTable(fogdata)
	net.Send(ply)

end

function gDisasters_Revived.CreateGlobalFog(parent_entity, data, override_quality)
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived.CreateFog(v, parent_entity, data, override_quality)
		
	end

end

function gDisasters_Revived.ResetOutsideFactor(ply) 
	
	net.Start("gdr_resetoutsidefactor")
	net.Send(ply)

end

function gDisasters_Revived.ResetGlobalOutsideFactor()
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived.ResetOutsideFactor(v)
	end
	

end

function gDisasters_Revived.RemoveGlobalFog()
	if GetConVar("gdisasters_revived_graphics_fog"):GetInt() <= 0 then return end

	net.Start("gdr_removegfxfog")
	net.WriteBool(true)
	net.WriteBool(false)
	net.Broadcast()

		
end

function gDisasters_Revived.RemoveGlobalGFX()
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end

	net.Start("gdr_removegfxfog")
	net.WriteBool(false)
	net.WriteBool(true)
	net.Broadcast()

	

end



function gDisasters_Revived.CreateGFX(ply, parent_entity, effect)
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end

	net.Start("gdr_creategfx")
	net.WriteEntity(parent_entity)
	net.WriteString(effect)
	net.Send(ply)
		
		
end

function gDisasters_Revived.CreateGlobalGFX(effect, parent_entity)
	if GetConVar("gdisasters_revived_graphics_gfx"):GetInt() <= 0 then return end
	for k, v in pairs(player.GetAll()) do
		gDisasters_Revived.CreateGFX(v, parent_entity, effect)
	
	end

end

