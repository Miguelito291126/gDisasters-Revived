AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable		            	 = false        
ENT.AdminSpawnable		             = false 

ENT.PrintName		                 =  "Meteorite"
ENT.Author			                 =  "Hmm"
ENT.Contact		                     =  "Hmm"
ENT.Category                         =  "Hmm"

    
ENT.Mass                             =  100
ENT.Model                            =  "models/props_junk/PopCan01a.mdl"

function ENT:Initialize()	

	
	if (SERVER) then
		
		self:SetModel(self.Model)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_NONE )
		self:SetMoveType( MOVETYPE_NONE  )
		self:SetUseType( ONOFF_USE )
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		local phys = self:GetPhysicsObject()

		if (phys:IsValid()) then
			phys:SetMass(self.Mass)
		end 		

		if gDisasters_Revived.IsMapRegistered() == true then
			self:CreateMoon()
		else
			self:Remove()
			gDisasters_Revived.Warning("This map is incompatible with this addon! Tell the addon owner about this as soon as possible and change to gm_flatgrass or construct.", true) 
		end
		self:SetNoDraw(true)
		
		
	end
end

function ENT:CreateMoon()

	
	local bounds    = gDisasters_Revived.getMapSkyBox()
	local min       = bounds[1]
	local max       = bounds[2]
		
	local startpos  = self:GetPos()
	local endpos    = Vector(startpos.x,startpos.y ,max.z)	


	local tr = util.TraceLine( {
		start  = startpos,
		endpos = endpos,
		mask   = MASK_NPCWORLDSTATIC,
		filter = function(ent)
			-- Ignora absolutamente todas las entidades (jugadores, props, NPCs)
			return false 
		end
	} )

	local spawnPos = tr.HitSky and tr.HitPos or Vector(startpos.x, startpos.y, max.z - 100)

	local moite = ents.Create("gdr_d12_moonimpact_ch")	
	moite:SetPos( spawnPos )
	moite:Spawn()
	moite:Activate()
	moite:GetPhysicsObject():EnableMotion(true)
	moite:GetPhysicsObject():SetVelocity( Vector(0,0,math.random(-0.0000000000000001, -1)))
	moite:GetPhysicsObject():AddAngleVelocity( VectorRand() * 5 )
	self:Remove()
	
	
end


function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end

	self.OWNER = ply
	local ent = ents.Create( self.ClassName )
	ent:SetPhysicsAttacker(ply)
	ent:SetPos( tr.HitPos + tr.HitNormal    ) 
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:OnRemove()

end

function ENT:Draw()



	self:DrawModel()
	
end




