
util.AddNetworkString( "gdr_clmenu_vars" )
util.AddNetworkString( "gdr_isOutdoor" )
util.AddNetworkString( "gdr_clParticles" )
util.AddNetworkString( "gdr_clParticles_ground" )
util.AddNetworkString( "gdr_screen_particles" )	
util.AddNetworkString( "gdr_maplight_cl")
util.AddNetworkString( "gdr_seteyeangles_cl")
util.AddNetworkString( "gdr_vomit")
util.AddNetworkString( "gdr_vomit_blood")
util.AddNetworkString( "gdr_sneeze")
util.AddNetworkString( "gdr_sneeze_big")
util.AddNetworkString( "gdr_lightning_bolt")
util.AddNetworkString( "gdr_createdecals")
util.AddNetworkString( "gdr_sendsound" )
util.AddNetworkString( "gdr_stopsound" )
util.AddNetworkString( "gdr_ambientlight"	)
util.AddNetworkString( "gdr_shakescreen"	)
util.AddNetworkString( "gdr_soundwave" )
util.AddNetworkString( "gdr_soundwave_stop")
util.AddNetworkString( "gdr_WeatherChange" )
util.AddNetworkString( "gdr_UpdateTemperature" )
util.AddNetworkString( "gdr_UpdateWeather" )

util.AddNetworkString( "gdr_CreateCeilingWaterDrops" )		
util.AddNetworkString( "gdr_RemoveCeilingWaterDrops" )	

util.AddNetworkString( "gdr_entity_exists_on_server" )

util.AddNetworkString( "gdr_createfog" )
util.AddNetworkString( "gdr_creategfx" )
util.AddNetworkString( "gdr_removegfxfog" )
util.AddNetworkString( "gdr_resetoutsidefactor" )

util.AddNetworkString( "gdr_net" )
util.AddNetworkString( "gdr_net_tvirus" )

net.Receive( "gdr_clmenu_vars", function( len, pl )
	if !pl:IsAdmin() or !pl:IsSuperAdmin() then return end
	
	local cvar = net.ReadString();
	local val = net.ReadFloat();

	if( GetConVar( tostring( cvar ) ) == nil ) then return end
	if( GetConVar( tostring( cvar ) ):GetInt() == tonumber( val ) ) then return end

	game.ConsoleCommand( tostring( cvar ) .." ".. tostring( val ) .."\n" );
end)

net.Receive("gdr_ambientlight", function()
	local ent = net.ReadEntity()
	local aLL = net.ReadVector()
	ent.AmbientLight = aLL
end)

net.Receive("gdr_vomit_blood", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomitblood.wav", 80, 100)
	ParticleEffectAttach( "vomit_blood_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)

net.Receive("gdr_vomit", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomit.wav", 80, 100)
	ParticleEffectAttach( "vomit_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)

net.Receive("gdr_sneeze", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomit.wav", 80, 100)
	ParticleEffectAttach( "sneeze_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)
net.Receive("gdr_sneeze_big", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomitblood.wav", 80, 100)
	ParticleEffectAttach( "sneeze_big_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)
	
