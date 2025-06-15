mag = {}

mag.Name = "g3sg1_20"
mag.PrintName = "G3SG1 Magazine"
mag.Capacity = 20
mag.MagType = "g3sg1"
mag.AmmoType = "ar2"
mag.Model = "models/weapons/arcticvr/g3sg1_mag.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1}
}
mag.Pose = {
    pos = Vector(-3, 1, 2),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)