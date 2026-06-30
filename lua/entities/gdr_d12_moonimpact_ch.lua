AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable		            	 = false        
ENT.AdminSpawnable		             = false 

ENT.PrintName		                 =  "Moon"
ENT.Author			                 =  "Hmm"
ENT.Contact		                     =  "Hmm"
ENT.Category                         =  "Hmm"

ENT.Model                            = "models/ramses/models/nature/moon.mdl"


function ENT:Initialize()	
	
	if (SERVER) then
		
		self:SetModel(self.Model)
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS  )
		self:SetUseType( ONOFF_USE )

		
		local phys = self:GetPhysicsObject()
		phys:Wake()
		
		if (phys:IsValid()) then
			phys:SetMass(700)
		end 		
		
		phys:EnableDrag( false )	
		
		timer.Simple(14, function()
			if !self:IsValid() then return end
			self:Remove()
		end)

	end
end


function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end

	self.OWNER = ply
	local ent = ents.Create( self.ClassName )
	ent:SetPhysicsAttacker(ply)
	ent:SetPos( tr.HitPos + tr.HitNormal * -1.00  ) 
	ent:Spawn()
	ent:Activate()
	return ent
	
end


function ENT:PhysicsCollide( data, physobj )
	
	local tr,trace = {},{}
	tr.start = self:GetPos() + self:GetForward() * -200
	tr.endpos = tr.start + self:GetForward() * 500
	tr.filter = { self, physobj }
	trace = util.TraceLine( tr )
	
	if( trace.HitSky ) then
		return
	end

	if (data.Speed > 200 ) then 
		self:Explode()
	end

	
end

function ENT:MegaTsunamiCreate( pos )
	
	if gDisasters_Revived.isinWater(self) or  gDisasters_Revived.isUnderWater(self) then
		self:Explode()
		local ent = ents.Create("gdr_d10_megatsunami")
		if IsValid(ent) then
			ent:SetPos(pos)
			ent:Spawn()
			ent:Activate()
		end
	elseif gDisasters_Revived.isinLava(self) or  gDisasters_Revived.isUnderLava(self) then
		self:Explode()
		local ent = ents.Create("gdr_d11_lava_megatsunami")
		if IsValid(ent) then
			ent:SetPos(pos)
			ent:Spawn()
			ent:Activate()
		end
	end
end

function ENT:Explode()

	if( !IsValid( self.Owner ) ) then
		
		self.Owner = self
		
	end
	
	local metsound = "streams/disasters/space/chucxulub/chucxulub.wav"
	
	ParticleEffect("chicxuclub_explosion_main", self:GetPos(), Angle(0,0,0), nil)
	
	gDisasters_Revived.CreateSoundWave(metsound, self:GetPos(), "3d" ,340.29, {100,110}, 5)
	
	local earthquake = ents.Create("gdr_d12_rs12eq")
	if IsValid(earthquake) then
		earthquake:Spawn()
		earthquake:Activate()
		earthquake:SetPos(self:GetPos())
	end

	
	for k,v in pairs(ents.FindInSphere(self:GetPos(), 5000000)) do

		local dist = ( v:GetPos() - self:GetPos() ):Length() 	

		if (  v != self && IsValid( v ) && IsValid( v:GetPhysicsObject() ) ) and (v:GetClass()!= "phys_constraintsystem" and v:GetClass()!= "phys_constraint"  and v:GetClass()!= "logic_collision_pair") then 

			if dist < 5000000 then 
				if( !v.Destroy ) then
					constraint.RemoveAll( v )
					v:GetPhysicsObject():EnableMotion(true)
					v:GetPhysicsObject():Wake()
					v.Destroy = true
				end
			end
		end
	end
	
	local pe = ents.Create( "env_physexplosion" );
	pe:SetPos( self:GetPos() );
	pe:SetKeyValue( "Magnitude", 5000000 );
	pe:SetKeyValue( "radius", 5000000 );
	pe:SetKeyValue( "spawnflags", 19 );
	pe:Spawn();
	pe:Activate();
	pe:Fire( "Explode", "", 0 );
	pe:Fire( "Kill", "", 0.5 );
	
	util.BlastDamage( self, self, self:GetPos()+Vector(0,0,12), 5000000, math.random( 100000, 400000 ) )

	if GetConVar("gdisasters_revived_volcano_weatherchange"):GetInt() <= 0 then return end

	timer.Simple(2, function()
		local ent = ents.Create("gdr_w2_ashstorm")
		local ent2 = ents.Create("gdr_d9_meteorshower")
		local ent3 = ents.Create("gdr_d10_meteoriteshower")
		if IsValid(ent) then ent:Spawn() ent:Activate() end
        if IsValid(ent2) then ent2:Spawn() ent2:Activate() end
        if IsValid(ent3) then ent3:Spawn() ent3:Activate() end

	end)
	timer.Simple(120, function()
		local ent1 = ents.FindByClass("gdr_w2_ashstorm")[1]
		if IsValid(ent1) then ent1:Remove() end

		local ent4 = ents.Create("gdr_w4_heavyacidrain")
		if IsValid(ent4) then ent4:Spawn() ent4:Activate() end
	end)
	timer.Simple(160, function()
		local ent1 = ents.FindByClass("gdr_d9_meteorshower")[1]
		local ent2 = ents.FindByClass("gdr_d10_meteoriteshower")[1]
		if IsValid(ent1) then ent1:Remove() end
		if IsValid(ent2) then ent2:Remove() end
	end)
	timer.Simple(200, function()
		local ent4 = ents.FindByClass("gdr_w4_heavyacidrain")[1]
		if IsValid(ent4) then ent4:Remove() end
	end)

	self:Remove()

		
end


function ENT:Think()
	local t =  ( (1 / (engine.TickInterval())) ) / 66.666 * 0.1	
	
	if SERVER then
		self:MegaTsunamiCreate(self:GetPos())
	end

	self:NextThink(CurTime() + t)
	return true	
			
end


function ENT:OnRemove()
end

function ENT:Draw()

	self:DrawModel()
	
end




