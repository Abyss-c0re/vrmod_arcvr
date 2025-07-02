AddCSLuaFile()
ArcticVR = ArcticVR or {}
if CLIENT then
	ArcticVR.RegisterCustomShell("arcticvr_case_357", "models/weapons/arcticvr/357case.mdl", 100, ArcticVR.ShellSoundsTable, 1)
	ArcticVR.RegisterCustomShell("arcticvr_bullet_357", "models/weapons/arcticvr/357bullet.mdl", 105, ArcticVR.ShellSoundsTable, 1)
	ArcticVR.RegisterCustomShell("arcticvr_case_40mm", "models/weapons/arcticvr/40mmcase.mdl", 75, ArcticVR.ShellSoundsTable, 1)
	ArcticVR.RegisterCustomShell("arcticvr_nade_40mm", "models/weapons/arcticvr/40mmnade.mdl", 80, ArcticVR.ShellSoundsTable, 1)
	ArcticVR.RegisterCustomShell("arcticvr_case_25mm", "models/weapons/arcticvr/25mmcase.mdl", 81, ArcticVR.ShellSoundsTable, 1)
	ArcticVR.RegisterCustomShell("arcticvr_nade_25mm", "models/weapons/arcticvr/25mmnade.mdl", 86, ArcticVR.ShellSoundsTable, 1)
	surface.CreateFont("AVR_LCD_24_Glow", {
		font = "Open 24 Display St",
		size = 24,
		weight = 0,
		additive = false,
		blursize = 1,
		scanlines = 1,
		antialias = true,
	})
end