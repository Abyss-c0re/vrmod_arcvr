mag = {}

mag.Name = "xm25cdte_5"
mag.PrintName = "XM25 CDTE Magazine"
mag.Capacity = 5
mag.MagType = "xm25cdte"
mag.AmmoType = "SMG1_Grenade"
mag.Model = "models/weapons/arcticvr/mag_xm25cdte.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1},
    [2] = {ind = 2, bg = 1}
}
mag.Pose = {
    pos = Vector(10, 1, 3.5),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)