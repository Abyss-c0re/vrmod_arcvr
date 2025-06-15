mag = {}

mag.Name = "thompson_30"
mag.PrintName = "Thompson Magazine"
mag.Capacity = 30
mag.MagType = "thompson"
mag.AmmoType = "pistol"
mag.Model = "models/weapons/arcticvr/mag_thompson.mdl"
mag.BodygroupsShowBullets = {
    [1] = {ind = 1, bg = 1},
    [2] = {ind = 2, bg = 1}
}
mag.Pose = {
    pos = Vector(0, 1, 5),
    ang = Angle(0, 0, 0)
}

ArcticVR.LoadMagazineType(mag)