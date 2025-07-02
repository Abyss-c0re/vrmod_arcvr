AddCSLuaFile()
mag = {}
mag.Name = "rpg7rocket_1"
mag.PrintName = "RPG-7 Rocket"
mag.Capacity = 1
mag.MagType = "rpg7rocket"
mag.AmmoType = "RPG_Round"
mag.Model = "models/weapons/arcticvr/rpg7_rocket.mdl"
mag.Pose = {
    pos = Vector(4, 1, 1),
    ang = Angle(30, 0, 0)
}

ArcticVR.LoadMagazineType(mag)