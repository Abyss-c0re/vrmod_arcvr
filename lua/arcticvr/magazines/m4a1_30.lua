mag = {}
mag.Name = "m4a1_30"
mag.PrintName = "M4A1 Magazine"
mag.Capacity = 30
mag.MagType = "m4a1"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_m4a1.mdl"
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
    pos = Vector(10, 6.3, 8.5),
    ang = Angle(30, 20, 0)
}

ArcticVR.LoadMagazineType(mag)