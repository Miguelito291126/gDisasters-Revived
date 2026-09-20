AddCSLuaFile()

gDisasters_Revived.Msg("LOADING TVIRUS... ")

gDisasters_Revived.npc_tvirus = {
	"npc_monk",
	"npc_metropolice",
	"npc_combine_s",
	"npc_stalker",
	"npc_alyx",
	"npc_barney",
	"npc_magnusson",
	"npc_kleiner",
	"npc_eli",
	"npc_kleiner",
	"npc_mossman",
	"npc_gman",
	"npc_citizen",
	"npc_breen"
}

for i = 1, #gDisasters_Revived.npc_tvirus do
	gDisasters_Revived.Msg("LOADING TABLE: " .. gDisasters_Revived.npc_tvirus[i])
end

gDisasters_Revived.Msg("FINISH")
