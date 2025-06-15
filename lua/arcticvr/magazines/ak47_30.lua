mag = {}

mag.Name = "ak47_30"
mag.PrintName = "AK-47 Magazine"
mag.Capacity = 30
mag.MagType = "ak47"
mag.AmmoType = "ar2"
mag.Model = "models/weapons/arcticvr/mag_ak47.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1},
    [2] = {ind = 2, bg = 1},
    [3] = {ind = 3, bg = 1}
}
mag.Pose = {
    pos = Vector(10, 6, 9),
    ang = Angle(50, 20, 0)
}

ArcticVR.LoadMagazineType(mag)