AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/pistol_mk22.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_mk22.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR Mk22"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil

SWEP.DamageMin = 15
SWEP.DamageMax = 80
SWEP.MaxRange = 3500
SWEP.Penetration = 6
SWEP.MuzzleVelocity = 10000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 2
SWEP.ShotVolume = 75
SWEP.RPM = 700
SWEP.Recoil = 0.8
SWEP.RecoilVertical = 7
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 200
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "pistol"

SWEP.MagType = "mk22"
SWEP.DefaultMagazine = "mk22_12"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_9x19"
SWEP.BulletEffect = "arcticvr_bullet_9x19"

SWEP.FireSound = "weapons/usp/usp1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/usp/usp_slideback2.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/p228_slideforward.wav"
SWEP.SlideReleaseSound = "weapons/usp/usp_sliderelease.wav"
SWEP.MagInSound = "weapons/usp/usp_clipin.wav"
SWEP.MagOutSound = "weapons/usp/usp_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.NonAutoloading = true

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_mk22 = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.CanLockBack = false
SWEP.MagCanDropFree = true
SWEP.BoltCanAutoRelease = false
SWEP.SlideNoAutoReciprocate = false

SWEP.SlideMins = Vector(-3, -0.6, -7)
SWEP.SlideMaxs = Vector(3, 4, 2.5)

SWEP.MagazineInsertMins = Vector(-3, -8, -3)
SWEP.MagazineInsertMaxs = Vector(3, 0, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.BurstLength = 0
SWEP.SlideGrabbed = false
SWEP.SlideReleasing = false
SWEP.SlidePos = 0
SWEP.SlideLockedBack = false
SWEP.NeedAnotherTriggerPull = false
SWEP.OpenBolt = false
SWEP.LastSlidePos = 0
SWEP.Firemode = 1 -- 0 = safe, 1 = semi, 2 = auto, negative = burst
SWEP.RecoilAngles = Angle(0, 0, 0)
SWEP.RecoilBlowback = 0
SWEP.CSMagazine = nil
SWEP.CSMagazineInsertionTime = 0
SWEP.CSMagazineOriginal = {
    pos = Vector(0, 0, 0),
    ang = Angle(0, 0, 0)
}

SWEP.SlideBlowbackAmount = 1.7

SWEP.BoneIndices = {
    mk22 = 0,
    hammer = 1,
    mag = 2,
    trigger = 3,
    slide = 4,
    selector = 5,
    bullet = 6,
    muzzle = 7,
    eject = 8,
    slidelock = 9,
}

SWEP.MiscLerps = {
}

SWEP.TargetMiscLerps = {
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, -35)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    }
}

SWEP.Firemodes = {
    1,
    0
}

end