AddCSLuaFile()
mag = {}
mag.Name = "12gshell_1"
mag.PrintName = "12 Gauge Shell"
mag.Capacity = 1
mag.MagType = "12g"
mag.AmmoType = "buckshot"
mag.Model = "models/weapons/arcticvr/12gshell.mdl"
mag.Pose = {
    pos = Vector(-3, -3, 3),
    ang = Angle(30, 0, 0)
}

ArcticVR.LoadMagazineType(mag)