gDisasters_Revived.Effects = {}

gDisasters_Revived.Effects["sunny"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] = 0
		cm[ "$pp_colour_brightness" ] = 0 
		cm[ "$pp_colour_contrast" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/160)
		cm[ "$pp_colour_colour" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/320)
		cm[ "$pp_colour_mulr" ] = 0
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] = 0
	
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end

gDisasters_Revived.Effects["heatwave"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/700)
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] = 0
		cm[ "$pp_colour_brightness" ] = 0 
		cm[ "$pp_colour_contrast" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/160)
		cm[ "$pp_colour_colour" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/320)
		cm[ "$pp_colour_mulr" ] = 0
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] = 0
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end	
gDisasters_Revived.Effects["coldwave"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
		local cm = {}
		cm[ "$pp_colour_addr" ] =  0
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] = (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/1240)
		cm[ "$pp_colour_brightness" ] = 0 
		cm[ "$pp_colour_contrast" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/320)
		cm[ "$pp_colour_colour" ] = 1 + (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/320)
		cm[ "$pp_colour_mulr" ] = 0
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] = 0
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end	
gDisasters_Revived.Effects["sandstormy"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
	

		
		
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0.2 * (LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)
		cm[ "$pp_colour_addg" ] = 0.05 * (LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)
		cm[ "$pp_colour_addb" ] = -0.25 * (LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)
		cm[ "$pp_colour_brightness" ] = 0
		cm[ "$pp_colour_contrast" ] = 1 - ((LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)/2)
		cm[ "$pp_colour_colour" ] = 1
		cm[ "$pp_colour_mulr" ] = 0.05 * (LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] =  -0.25 * (LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end


gDisasters_Revived.Effects["heavyrain"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
	

		
		
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] =  0
		cm[ "$pp_colour_brightness" ] = 0
		cm[ "$pp_colour_contrast" ] = 1 
		cm[ "$pp_colour_colour" ] = 1
		cm[ "$pp_colour_mulr" ] = 0
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] = 0
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end

gDisasters_Revived.Effects["kingramses"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
	

		
		local cm = {}
		cm[ "$pp_colour_addr" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_addg" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_addb" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_brightness" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_contrast" ] = math.random(-1000,1000)/1000 
		cm[ "$pp_colour_colour" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_mulr" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_mulg" ] = math.random(-1000,1000)/1000
		cm[ "$pp_colour_mulb" ] = math.random(-1000,1000)/1000
		
		
		DrawColorModify( cm )
		
		
		
		surface.SetTexture(surface.GetTextureID(table.Random({"hud/king_ramses_02", "hud/king_ramses_01", "hud/king_ramses_03"})))
		surface.SetDrawColor( 255, 255, 255, math.random(1,256))
		surface.DrawTexturedRect( 0, 0,ScrW(), ScrH() )
		
		if math.random(1,16)==1 then surface.PlaySound( table.Random({"ambient/voices/f_scream1.wav","ambient/voices/m_scream1.wav","ambient/voices/squeal1.wav"})) end

		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end


gDisasters_Revived.Effects["heavyfog"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
	

		
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] = 0
		cm[ "$pp_colour_brightness" ] = 0
		cm[ "$pp_colour_contrast" ] = 1 - ((LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)/2)
		cm[ "$pp_colour_colour" ] = 1 - ((LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)/8)
		cm[ "$pp_colour_mulr" ] = 0
		cm[ "$pp_colour_mulg" ] = 0
		cm[ "$pp_colour_mulb" ] = 0
		
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end

gDisasters_Revived.Effects["night"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX")
	
	local function RenderEffect()
	
	

		
		local cm = {}
		cm[ "$pp_colour_addr" ] = 0
		cm[ "$pp_colour_addg" ] = 0
		cm[ "$pp_colour_addb" ] = 0
		cm[ "$pp_colour_brightness" ] = -0.2
		cm[ "$pp_colour_contrast" ] = 1 - ((LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent/0.8)/2)
		cm[ "$pp_colour_colour" ] = 0.5 - (LocalPlayer().gDisasters_Revived.Outside.OutsideFactor/320)
		cm[ "$pp_colour_mulr" ] = 0.2
		cm[ "$pp_colour_mulg" ] = 0.05
		cm[ "$pp_colour_mulb" ] = 0.05
		
		
		DrawColorModify( cm )
		
		if LocalPlayer().gDisasters_Revived.GFX.Parent:IsValid() == false then hook.Remove("RenderScreenspaceEffects", "gDisasters_GFX") LocalPlayer().gDisasters_Revived.GFX.Effect = "none" LocalPlayer().gDisasters_Revived.GFX.Parent = false end 
		
	end
	hook.Add("RenderScreenspaceEffects", "gDisasters_GFX", RenderEffect )

end

gDisasters_Revived.Effects["RENDERFOG"] = function()

	hook.Remove("RenderScreenspaceEffects", "gDisasters_RenderFog")

	hook.Remove("SetupSkyboxFog", "gdr_RenderFogSkybox")
	hook.Remove("SetupWorldFog", "gdr_RenderFog")
	

	local function gdr_RenderFogWorld()
		
		local isOutside         = LocalPlayer().isOutside 
		local fogColor          = LocalPlayer().gDisasters_Revived.Fog.Data.Color
		
		
		render.FogMode( MATERIAL_FOG_LINEAR	 ) 
		render.FogStart( 0 ) 
		render.FogEnd( LocalPlayer().gDisasters_Revived.Fog.Data.EndMinCurrent )
		render.FogMaxDensity(LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent) 
		render.FogColor(fogColor.r,fogColor.g,fogColor.b)
		
		return true
	end

	local function gdr_RenderFogSkybox()
		local isOutside         = LocalPlayer().isOutside 
		local fogColor          = LocalPlayer().gDisasters_Revived.Fog.Data.Color

		render.FogMode( MATERIAL_FOG_LINEAR	 ) 
		render.FogStart( 0 ) 
		render.FogEnd( 0 )
		render.FogMaxDensity(LocalPlayer().gDisasters_Revived.Fog.Data.DensityCurrent) 
		render.FogColor(fogColor.r,fogColor.g,fogColor.b)
	
		return true
	end
						
						
	local function RenderFog()
		
		if LocalPlayer().gDisasters_Revived.Fog.OQ == true then
		
		else 
			
			if GetConVar( "gdisasters_revived_graphics_fog_quality" ):GetInt() >= 4 then
				if CurTime() >= LocalPlayer().gDisasters_Revived.Fog.NextEmitTime then 
					
					if math.random(1, 2 * ( ( GetConVar( "gdisasters_revived_graphics_fog_quality" ):GetInt() + 1 ) * 2)  )==1 and LocalPlayer().gDisasters_Revived.Outside.IsOutside then
							
						ParticleEffect( "renderfog_main_HQ", LocalPlayer():GetPos(), Angle(0,0,0), nil )
					
					end
					
					LocalPlayer().gDisasters_Revived.Fog.NextEmitTime = CurTime() + 0.01
				else
				end
			
			end
		end
		if LocalPlayer().gDisasters_Revived.Fog.Parent:IsValid()==false then
			
			hook.Remove("RenderScreenspaceEffects", "gDisasters_RenderFog")
			hook.Remove("SetupSkyboxFog", "gdr_RenderFogSkybox")
			hook.Remove("SetupWorldFog", "gdr_RenderFogWorld")
			LocalPlayer().gDisasters_Revived.Fog.Parent = "none"
			
			
		end

		
	
	end
	
	if LocalPlayer().gDisasters_Revived.Fog.OQ == true then 
		hook.Add("SetupSkyboxFog", "gdr_RenderFogSkybox", gdr_RenderFogSkybox)
		hook.Add("SetupWorldFog", "gdr_RenderFogWorld", gdr_RenderFogWorld) 		
		hook.Add("RenderScreenspaceEffects", "gDisasters_RenderFog", RenderFog )
	else
		hook.Add("SetupSkyboxFog", "gdr_RenderFogSkybox", gdr_RenderFogSkybox)
		hook.Add("SetupWorldFog", "gdr_RenderFogWorld", gdr_RenderFogWorld) 		
		hook.Add("RenderScreenspaceEffects", "gDisasters_RenderFog", RenderFog )
		LocalPlayer().gDisasters_Revived.Fog.Data.DensityMax = (LocalPlayer().gDisasters_Revived.Fog.Data.DensityMax/5) * (2 + GetConVar( "gdisasters_revived_graphics_fog_quality" ):GetInt())

	end

end


