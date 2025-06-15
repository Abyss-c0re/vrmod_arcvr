mag = {}

mag.Name = "awm_5"
mag.PrintName = "AWM Magazine"
mag.Capacity = 5
mag.MagType = "awm"
mag.AmmoType = "ar2"
mag.Model = "models/weapons/arcticvr/awp_mag.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1}
}
mag.Pose = {
    pos = Vector(-3, 1, 2),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)