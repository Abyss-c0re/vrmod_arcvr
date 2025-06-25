mag = {}
mag.Name = "fiveseven_20"
mag.PrintName = "Five-seveN Magazine"
mag.Capacity = 20
mag.MagType = "fiveseven"
mag.AmmoType = "smg1"
mag.Model = "models/weapons/arcticvr/mag_fiveseven.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(5, 1, 4),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)