AddCSLuaFile()
mag = {}
mag.Name = "sg552_20"
mag.PrintName = "SG552 Magazine"
mag.Capacity = 20
mag.MagType = "sg552"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_sg552.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(-2, 1, 6),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)