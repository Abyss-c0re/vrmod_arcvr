mag = {}

mag.Name = "p90_50"
mag.PrintName = "P90 Magazine"
mag.Capacity = 50
mag.MagType = "p90"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_p90.mdl"
mag.BodygroupsShowBullets = {
}
mag.Pose = {
    pos = Vector(9, 1, -1),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)