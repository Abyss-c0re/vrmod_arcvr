mag = {}

mag.Name = "famas_25"
mag.PrintName = "FAMAS Magazine"
mag.Capacity = 25
mag.MagType = "famas"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_famas.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1}
}
mag.Pose = {
    pos = Vector(10, 1, 5.5),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)