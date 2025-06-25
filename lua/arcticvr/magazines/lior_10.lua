mag = {}
mag.Name = "lior_10"
mag.PrintName = "Lior-12 Magazine"
mag.Capacity = 10
mag.MagType = "lior"
mag.AmmoType = "buckshot"
mag.Model = "models/weapons/arcticvr/mag_lior.mdl"
mag.BodygroupsShowBullets = {
    [1] = {
        ind = 1,
        bg = 1
    }
}

mag.Pose = {
    pos = Vector(-3, 1, 4),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)