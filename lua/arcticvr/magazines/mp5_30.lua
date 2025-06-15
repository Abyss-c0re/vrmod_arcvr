mag = {}

mag.Name = "mp5_30"
mag.PrintName = "MP5 Magazine"
mag.Capacity = 30
mag.MagType = "mp5"
mag.AmmoType = "pistol"
mag.Model = "models/weapons/arcticvr/mag_mp5.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1},
    [2] = {ind = 2, bg = 1},
    [3] = {ind = 3, bg = 1}
}
mag.Pose = {
    pos = Vector(9.9, 6.4, 9),
    ang = Angle(50, 0, 0)
}

ArcticVR.LoadMagazineType(mag)