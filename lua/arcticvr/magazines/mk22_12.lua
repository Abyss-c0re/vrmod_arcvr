mag = {}
mag.Name = "mk22_12"
mag.PrintName = "Mk22 Magazine"
mag.Capacity = 12
mag.MagType = "mk22"
mag.AmmoType = "pistol"
mag.Model = "models/weapons/arcticvr/mag_mk22.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    },
    [2] = {
        ind = 2,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(5, 1, 4),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)