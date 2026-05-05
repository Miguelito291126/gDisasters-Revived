
util.AddNetworkString( "gdr_dclmenu_vars" )
util.AddNetworkString( "gdr_disOutdoor" )
util.AddNetworkString( "gdr_dclParticles" )
util.AddNetworkString( "gdr_dclParticles_ground" )
util.AddNetworkString( "gdr_dscreen_particles" )	
util.AddNetworkString( "gdr_dmaplight_cl")
util.AddNetworkString( "gdr_dseteyeangles_cl")
util.AddNetworkString( "gdr_dvomit")
util.AddNetworkString( "gdr_dvomit_blood")
util.AddNetworkString( "gdr_dsneeze")
util.AddNetworkString( "gdr_dsneeze_big")
util.AddNetworkString( "gdr_dlightning_bolt")
util.AddNetworkString( "gdr_dcreatedecals")
util.AddNetworkString( "gdr_dsendsound" )
util.AddNetworkString( "gdr_dstopsound" )
util.AddNetworkString( "gdr_dambientlight"	)
util.AddNetworkString( "gdr_dshakescreen"	)
util.AddNetworkString( "gdr_dsoundwave" )
util.AddNetworkString( "gdr_dsoundwave_stop")
util.AddNetworkString( "gdr_dWeatherChange" )
util.AddNetworkString( "gdr_dUpdateTemperature" )
util.AddNetworkString( "gdr_dUpdateWeather" )

util.AddNetworkString( "gdr_dCreateCeilingWaterDrops" )		
util.AddNetworkString( "gdr_dRemoveCeilingWaterDrops" )	

util.AddNetworkString( "gdr_dentity_exists_on_server" )

util.AddNetworkString( "gdr_dcreatefog" )
util.AddNetworkString( "gdr_dcreategfx" )
util.AddNetworkString( "gdr_dremovegfxfog" )
util.AddNetworkString( "gdr_dresetoutsidefactor" )

util.AddNetworkString( "gdr_dnet" )
util.AddNetworkString( "gdr_dnet_tvirus" )

net.Receive( "gdr_dclmenu_vars", function( len, pl )
	if !pl:IsAdmin() or !pl:IsSuperAdmin() then return end
	
	local cvar = net.ReadString();
	local val = net.ReadFloat();

	if( GetConVar( tostring( cvar ) ) == nil ) then return end
	if( GetConVar( tostring( cvar ) ):GetInt() == tonumber( val ) ) then return end

	game.ConsoleCommand( tostring( cvar ) .." ".. tostring( val ) .."\n" );
end)

net.Receive("gdr_dambientlight", function()
	local ent = net.ReadEntity()
	local aLL = net.ReadVector()
	ent.AmbientLight = aLL
end)

net.Receive("gdr_dvomit_blood", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomitblood.wav", 80, 100)
	ParticleEffectAttach( "vomit_blood_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)

net.Receive("gdr_dvomit", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomit.wav", 80, 100)
	ParticleEffectAttach( "vomit_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)

net.Receive("gdr_dsneeze", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomit.wav", 80, 100)
	ParticleEffectAttach( "sneeze_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)
net.Receive("gdr_dsneeze_big", function()
	
	local ent = net.ReadEntity()
	local mouth_attach = ent:LookupAttachment("mouth")
	ent:EmitSound("streams/disasters/player/vomitblood.wav", 80, 100)
	ParticleEffectAttach( "sneeze_big_main", PATTACH_POINT_FOLLOW, ent, mouth_attach )

end)
	
