hook.Add( "InitPostEntity", "gDisastersRevivedFirstJoinLightmaps", function()

	render.RedownloadAllLightmaps();

	print("Redownload All Lightmaps")

end )

hook.Add( "CalcView", "gDisastersRevivedCalcView", function( pl, pos, ang, fov, nearZ, farZ )
	
	gDisasters_Revived.DayNightSystem.CalcView(pl, pos, ang, fov, nearZ, farZ)
	
end );

hook.Add( "RenderScene", "gDisastersRevivedRenderScene", function( origin, angles, fov )

	gDisasters_Revived.DayNightSystem.RenderScene(origin, angles, fov)

end );

hook.Add( "PostDrawSkyBox", "gDisastersRevivedPostDrawSkyBox", function()

	gDisasters_Revived.DayNightSystem.RenderMoon()

end)