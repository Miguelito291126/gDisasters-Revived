gDisasters_Revived.Game = {}

gDisasters_Revived.Game.AntiLag = {}

gDisasters_Revived.Game.AntiLag.Collisions = {}
gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash  = {}
gDisasters_Revived.Game.AntiLag.Collisions.PerSecond        = 0  
gDisasters_Revived.Game.AntiLag.Collisions.PerSecondPerProp = 0 

gDisasters_Revived.Game.AntiLag.NextThink = CurTime() 
gDisasters_Revived.Game.AntiLag.NumberOfProps               = 0 

gDisasters_Revived.Game.AntiLag.Collisions.PropEntryExists = function(prop)
	return gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash[prop]
end

gDisasters_Revived.Game.AntiLag.Collisions.AddPropEntry = function(prop)
	gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash[prop] = {Exists = true, Collisions = 0}
end

gDisasters_Revived.Game.AntiLag.Collisions.RemovePropEntry = function(prop)
	gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash[prop] = nil
end

gDisasters_Revived.Game.AntiLag.Collisions.GetNProps = function()
	return gDisasters_Revived.Game.AntiLag.NumberOfProps
end

gDisasters_Revived.Game.AntiLag.Collisions.GetPerSecond = function()
	return gDisasters_Revived.Game.AntiLag.Collisions.PerSecond
end

gDisasters_Revived.Game.AntiLag.Collisions.GetPerSecondPerProp = function()
	return gDisasters_Revived.Game.AntiLag.Collisions.PerSecondPerProp
end

gDisasters_Revived.Game.AntiLag.Collisions.PostPerPropCollisions = function(prop, collisions)
	if prop:IsValid() then 

		if collisions >= GetConVar("gdisasters_revived_antilag_maximum_safe_collisions_per_second_per_prop"):GetInt() then 
			prop:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			gDisasters_Revived.Game.AntiLag.Collisions.RemovePropEntry(prop)
		elseif collisions >= GetConVar("gdisasters_revived_antilag_maximum_safe_collisions_per_second_average"):GetInt() then
			prop:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			gDisasters_Revived.Game.AntiLag.Collisions.RemovePropEntry(prop)
		elseif collisions >= GetConVar("gdisasters_revived_antilag_post_damage_no_collide_base_time"):GetInt() then
			prop:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			gDisasters_Revived.Game.AntiLag.Collisions.RemovePropEntry(prop)
		end
	
	end
end

gDisasters_Revived.Game.AntiLag.Collisions.AppendNumberOfCollisions = function(number)
	gDisasters_Revived.Game.AntiLag.Collisions.PerSecond = gDisasters_Revived.Game.AntiLag.Collisions.PerSecond + number
end


gDisasters_Revived.Game.AntiLag.CollisionsLoop = function()

	
	
	local count = 0 
	for k, prop in pairs(ents.FindByClass("prop_physics")) do 
		if !gDisasters_Revived.Game.AntiLag.Collisions.PropEntryExists(prop) and (prop:GetCollisionGroup()==0) then
			gDisasters_Revived.Game.AntiLag.Collisions.AddPropEntry(prop)
			if not(prop.gDCallBackFunction) then 
				prop.gDCallBackFunction = true 
				prop:AddCallback( "PhysicsCollide", function(ent, data) 
				    if gDisasters_Revived.Game.AntiLag.Collisions.PropEntryExists(ent) and (ent:GetCollisionGroup()==0) then
					
						gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash[ent].Collisions = gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash[ent].Collisions + 1 + ((10 - math.Clamp(data.DeltaTime,0,10))*0.5)  
					end
				end)
			end
		end
		count = count + 1 
	end
	if count < 0 then return end 
	

	
	for k, v in pairs(gDisasters_Revived.Game.AntiLag.Collisions.PropPhysicsHash) do 
		gDisasters_Revived.Game.AntiLag.Collisions.AppendNumberOfCollisions(v.Collisions)
	
		gDisasters_Revived.Game.AntiLag.Collisions.PostPerPropCollisions(k, v.Collisions)
		v.Collisions = 0 
	end
	
	gDisasters_Revived.Game.AntiLag.NumberOfProps = count
	gDisasters_Revived.Game.AntiLag.Collisions.PerSecondPerProp = gDisasters_Revived.Game.AntiLag.Collisions.PerSecond / count 
	
end

gDisasters_Revived.Game.AntiLag.MainLoop  = function()
	if GetConVar("gdisasters_revived_antilag_enabled"):GetInt() == 1 then  
		if CurTime() < gDisasters_Revived.Game.AntiLag.NextThink then return end 
		
		gDisasters_Revived.Game.AntiLag.Collisions.PerSecond = 0 
		gDisasters_Revived.Game.AntiLag.Collisions.PerSecondPerProp = 0  
		
		gDisasters_Revived.Game.AntiLag.NextThink = CurTime() + 1 
		gDisasters_Revived.Game.AntiLag.CollisionsLoop()
	end	
end
hook.Add("Think", "gDisasters_Revived.Game.AntiLag.MainLoop", gDisasters_Revived.Game.AntiLag.MainLoop)













