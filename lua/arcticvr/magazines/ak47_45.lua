AddCSLuaFile()
mag = {}
mag.Name = "ak47_45"
mag.PrintName = "RPK Magazine"
mag.Capacity = 45
mag.MagType = "ak47"
mag.AmmoType = "ar2"
mag.Model = "models/weapons/arcticvr/mag_rpk.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(-3, 1, 4),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)