gDisasters_Revived.DamageTypes = {}

gDisasters_Revived.DamageTypes["acid"] = function(ent)
	ParticleEffectAttach("acid_damage", PATTACH_POINT_FOLLOW, ent, 0)

end

gDisasters_Revived.DamageTypes["elemental"] = function(ent)
	ParticleEffectAttach("acid_damage", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("fire_damage", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("heat_damage", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("electrical_damage_01", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("cold_damage", PATTACH_POINT_FOLLOW, ent, 0)
end

gDisasters_Revived.DamageTypes["energy"] = function(ent)
	ParticleEffectAttach("fire_damage", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("heat_damage", PATTACH_POINT_FOLLOW, ent, 0)
	ParticleEffectAttach("electrical_damage_01", PATTACH_POINT_FOLLOW, ent, 0)
end
gDisasters_Revived.DamageTypes["fire"] = function(ent)
	ParticleEffectAttach("fire_damage", PATTACH_POINT_FOLLOW, ent, 0)

end

gDisasters_Revived.DamageTypes["heat"] = function(ent)
	ParticleEffectAttach("heat_damage", PATTACH_POINT_FOLLOW, ent, 0)

end
gDisasters_Revived.DamageTypes["electrical"] = function(ent)
	
	
	ParticleEffectAttach("electrical_damage_01", PATTACH_POINT_FOLLOW, ent, 0)


end

gDisasters_Revived.DamageTypes["cold"] = function(ent)

	ParticleEffectAttach("cold_damage", PATTACH_POINT_FOLLOW, ent, 0)

end

gDisasters_Revived.DamageTypes["cold"] = function(ent)

	ParticleEffectAttach("cold_damage", PATTACH_POINT_FOLLOW, ent, 0)

end


function InflictDamage(ent, attacker, dmgtype, amount)

	ent:TakeDamage( amount, attacker, attacker )
	gDisasters_Revived.DamageTypes[dmgtype](ent)

end

function InflictDamageInSphere(pos, radius, attacker, dmgtype, amount )
	
	for k, v in pairs(ents.FindInSphere(pos, radius)) do
		
		InflictDamage(v, attacker, dmgtype, amount)
	end

end
	
