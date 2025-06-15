AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/lmg_rpk.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_mach_rpk.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 45
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "ar2"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR RPK"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 20
SWEP.DamageMax = 55
SWEP.MaxRange = 5000
SWEP.Penetration = 15
SWEP.MuzzleVelocity = 22000
SWEP.ShotVolume = 140
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.RPM = 500
SWEP.Firemode = 2
SWEP.Recoil = 1.95
SWEP.RecoilVertical = 3
SWEP.RecoilSide = 1.25
SWEP.RecoilBalance = Vector(-0.75, 0, 1)
SWEP.Spread = 1 / 200
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "ar2"

SWEP.MagType = "ak47"
SWEP.DefaultMagazine = "ak47_45"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_762wp"
SWEP.BulletEffect = "arcticvr_bullet_762wp"

SWEP.FireSound = "weapons/ak47/ak47-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/ak47_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/ak47_boltforward.wav"
SWEP.MagInSound = "weapons/ak47/ak47_clipin.wav"
SWEP.MagOutSound = "weapons/ak47/ak47_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_rpk = {
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

SWEP.SlideBlowbackAmount = 3.6

SWEP.BoneIndices = {
    mag = 1,
    trigger = 2,
    slide = 3,
    selector = 4,
    bullet = 5,
    foregrip = 8,
    magrelease = 9,
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, -12.4)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 6.7)}
    },
    [2] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    },
}

SWEP.Firemodes = {
    2,
    1,
    0
}

end