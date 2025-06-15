AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/launcher_m320.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_m320.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "SMG1_Grenade"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR M320"
SWEP.Slot = 4
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false


SWEP.MuzzleVelocity = 12000
SWEP.ShootEntity = "arcticvr_m320_proj"
SWEP.Num = 1
SWEP.Recoil = 7.5
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 750
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "SMG1_Grenade"

SWEP.MagType = "40mmnade"
SWEP.DefaultMagazine = "40mmnade_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_40mm"
SWEP.BulletEffect = "arcticvr_nade_40mm"

SWEP.FireSound = "weapons/grenade_launcher1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.OpenChamberSound = "weapons/p90/p90_cliprelease.wav"
SWEP.CloseChamberSound = "weapons/p90/p90_clipin.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 1

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_m320 = {
    offsetPos = Vector(5.5, 1.25, 2.0), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.TwoHanded = true
SWEP.NonAutoloading = true

SWEP.ForegripAngle = Angle(0, 0, 0)
SWEP.ForegripOffset = Vector(9, -2, 0)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 8)

SWEP.VolleyFire = true
SWEP.VolleyFireAlwaysAdvance = false
SWEP.VolleyFireAutoEject = true
SWEP.VolleyFireAutoEjectUnspent = false
SWEP.VolleyFireAlwaysFromChamberOne = true
SWEP.VolleyFireFromOneBarrel = false
SWEP.BreakAction = true
SWEP.BreakActionOpenAng = Angle(-40, 0, 0)
SWEP.BreakActionCloseVector = Vector(0, -2, 0)

SWEP.MagazineInsertMins = Vector(-4, -4, -4)
SWEP.MagazineInsertMaxs = Vector(4, 4, 4)

SWEP.CaseBones = {
    [1] = "chamber1",
}

SWEP.BulletBones = {
    [1] = "bullet1",
}


SWEP.BoneIndices = {
    m320 = 0,
    pivot = 1,
    muzzle1 = 2,
    chamber1 = 3,
    bullet1 = 4,
    safety = 5,
    foregrip = 6,
}



SWEP.Firemodes = {
    1
}

end