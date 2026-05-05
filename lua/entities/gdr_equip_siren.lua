AddCSLuaFile()

DEFINE_BASECLASS( "base_anim" )

ENT.Spawnable		            	 = false        
ENT.AdminSpawnable		             = false 

ENT.PrintName		                 =  "Siren"
ENT.Author			                 =  "Hmm"
ENT.Contact		                     =  "Hmm"
ENT.Category                         =  "Hmm"


ENT.Mass                             =  150


sound.Add( {
	name = "loudtornadosiren",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 110,
	pitch = { 90, 115 },
	sound = "streams/disasters/sirens/tornado_siren.mp3"
} )


function ENT:Initialize()	

	
	if (SERVER) then
		
		self:SetModel("models/ramses/models/siren/tornado_siren.mdl")
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS  )
		self:SetUseType( ONOFF_USE )
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		

		local phys = self:GetPhysicsObject()
		


		
		if (phys:IsValid()) then
			phys:SetMass(self.Mass)
			phys:Wake()
			phys:EnableMotion(true)
		end 		
		
		self.NextAvailableSoundEmission = CurTime()
		
	end
end


function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end

	self.OWNER = ply
	local ent = ents.Create( self.ClassName )
	ent:SetPhysicsAttacker(ply)
	ent:SetPos( tr.HitPos + tr.HitNormal * 10   ) 
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:Alarm()
	self:EmitSound("loudtornadosiren")
	
end 



function ENT:Think()
	if (SERVER) then 
		for k, v in pairs(ents.FindByClass("gdr_env_tornado")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_env_earthquake")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_env_dynamicwater_b")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_env_dynamiclava_b")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_env_dynamicwater")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_env_dynamiclava")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw1_catonehurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw2_cattwohurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_catthreehurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_catfourhurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw5_catfivehurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_catsixhurricane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw2_haboob")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw1_duststorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_heavythunderstorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_severethunderstorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw5_macroburst")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw5_downburst")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw5_microburst")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_drought")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_heavyacidrain")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw7_solarray")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_freezeray")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_neptune")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_redspot")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw2_volcano_ash")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw2_acidrain")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_heavyashstorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_major_hailstorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw2_blizzard")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_icestorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_hurricanic_lowpressure_sys")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw3_extremeheavyrain")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_strong_coldfront")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_strong_warmfront")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_strong_occludedfront")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw4_derecho")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw5_pyrocum")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_martiansnow")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_martianduststorm")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_dw6_hypercane")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d8_ancientvolcano")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d10_supervolcano")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d5_maturevolcano")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d10_moonimpact_ch")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d11_neutron_star")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d9_meteorshower")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d10_meteoriteshower")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d9_meteorite")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d6_meteor")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d6_cryoshower")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d7_lavabombshower")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d6_zombieapoc")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d8_combineinv")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d10_blackhole")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
		for k, v in pairs(ents.FindByClass("gdr_d9_whitehole")) do 
			
			
			if v:IsValid() and CurTime() >= self.NextAvailableSoundEmission then 
				self.NextAvailableSoundEmission = CurTime() + 120
				
				timer.Simple(v:GetPos():Distance(self:GetPos())/6000, function()
					if !self:IsValid() then return end 
					self:Alarm()
				end)
		
			end 
			
		end
	
	end 
end

function ENT:OnRemove()
	self:StopSound("loudtornadosiren")
end

function ENT:Draw()



	self:DrawModel()
	
end




