AddCSLuaFile()
mag = {}
mag.Name = "scout_10"
mag.PrintName = "Scout Magazine"
mag.Capacity = 10
mag.MagType = "scout"
mag.AmmoType = "ar2"
mag.Model = "models/weapons/arcticvr/mag_scout.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(-2, 1, 2),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)