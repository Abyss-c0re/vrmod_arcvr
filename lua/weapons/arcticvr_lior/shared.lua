AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/shotgun_lior.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR Lior-12"
SWEP.Slot = 3
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 2
SWEP.DamageMax = 15
SWEP.MaxRange = 2250
SWEP.Penetration = 2
SWEP.MuzzleVelocity = 9000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 2
SWEP.Num = 8
SWEP.RPM = 400
SWEP.Firemode = 1
SWEP.Recoil = 4
SWEP.RecoilVertical = 7
SWEP.RecoilSide = 3.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 15
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "buckshot"

SWEP.MagType = "lior"
SWEP.DefaultMagazine = "lior_10"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_shell_12g"
SWEP.BulletEffect = "arcticvr_shell_12g"

SWEP.FireSound = "weapons/xm1014/xm1014-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/galil_boltback.wav"
SWEP.SlideReleaseSound = "weapons/p228/p228_sliderelease.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/galil_boltforward.wav"
SWEP.MagInSound = "weapons/galil/galil_clipin.wav"
SWEP.MagOutSound = "weapons/galil/galil_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_lior = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.CanLockBack = false
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false

SWEP.TwoHanded = true

SWEP.ForegripAngle = Angle(0, -90, -90)
SWEP.ForegripOffset = Vector(16, -4, 3)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-3, -2, -3)
SWEP.SlideMaxs = Vector(6, 2, 3)

SWEP.MagazineInsertMins = Vector(-2, -4, -3)
SWEP.MagazineInsertMaxs = Vector(2, 0, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.SlideBlowbackAmount = 6

SWEP.BoneIndices = {
    lior = 0,
    magazine = 1,
    trigger = 2,
    slide = 3,
    selector = 4,
    muzzle = 5,
    eject = 6,
    foregrip = 7,
    magrelease = 8,
}


SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, -7)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 7)}
    },
}

SWEP.Firemodes = {
    1,
    0
}

end