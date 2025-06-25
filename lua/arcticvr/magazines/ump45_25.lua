mag = {}
mag.Name = "ump45_25"
mag.PrintName = "UMP-45 Magazine"
mag.Capacity = 25
mag.MagType = "ump45"
mag.AmmoType = "pistol"
mag.Model = "models/weapons/arcticvr/mag_ump45.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    },
    [2] = {
        ind = 2,
        bg = 1
    },
    [3] = {
        ind = 3,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(2.5, 6.5, 7.5),
    ang = Angle(10, 0, 0)
}

ArcticVR.LoadMagazineType(mag)