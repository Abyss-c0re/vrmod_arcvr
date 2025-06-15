AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/rifle_sg552.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_sg552.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "smg1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR SG552"
SWEP.Slot = 2
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 30
SWEP.DamageMax = 45
SWEP.MaxRange = 9000
SWEP.Penetration = 13
SWEP.MuzzleVelocity = 18000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 3
SWEP.RPM = 900
SWEP.Firemode = 2
SWEP.Recoil = 1.25
SWEP.RecoilVertical = 2
SWEP.RecoilSide = 1.6
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 215
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "smg1"

SWEP.MagType = "sg552"
SWEP.DefaultMagazine = "sg552_20"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_556"
SWEP.BulletEffect = "arcticvr_bullet_556"

SWEP.FireSound = "weapons/sg552/sg552-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/sg552_boltback.wav"
SWEP.SlideReleaseSound = "weapons/usp/usp_sliderelease.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/sg552_boltforward.wav"
SWEP.MagInSound = "weapons/sg552/sg552_clipin.wav"
SWEP.MagOutSound = "weapons/sg552/sg552_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_sg552 = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.CanLockBack = true
SWEP.MagCanDropFree = true
SWEP.BoltCanAutoRelease = false

SWEP.TwoHanded = true

SWEP.ForegripAngle = Angle(0, -90, -90)
SWEP.ForegripOffset = Vector(14, -4, 3)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-3, -2, -6)
SWEP.SlideMaxs = Vector(3, 2, 3)

SWEP.MagazineInsertMins = Vector(-3, -4, -3)
SWEP.MagazineInsertMaxs = Vector(3, 0, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.SlideLockbackAmount = 2.3
SWEP.SlideBlowbackAmount = 2.4

SWEP.BoneIndices = {
    sg552 = 0,
    mag = 1,
    trigger = 2,
    slide = 3,
    bullet = 4,
    selector = 5,
    muzzle = 6,
    eject = 7,
    foregrip = 8,
    magrelease = 9,
}


SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 34)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, -13)}
    },
    [2] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, -55)}
    },
}

SWEP.Firemodes = {
    2,
    1,
    0
}

end