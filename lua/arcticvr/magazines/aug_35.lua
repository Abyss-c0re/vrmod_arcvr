mag = {}

mag.Name = "aug_35"
mag.PrintName = "AUG Magazine"
mag.Capacity = 35
mag.MagType = "aug"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_aug.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1}
}
mag.Pose = {
    pos = Vector(10, 1, 5.5),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)