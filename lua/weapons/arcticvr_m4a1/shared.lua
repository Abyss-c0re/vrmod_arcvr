AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/rifle_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"


SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 30
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

SWEP.PrintName = "VR M4A1"
SWEP.Slot = 2
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil

SWEP.DamageMin = 30
SWEP.DamageMax = 45
SWEP.MaxRange = 6000
SWEP.Penetration = 13
SWEP.MuzzleVelocity = 200000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.RPM = 800
SWEP.Firemode = 2
SWEP.Recoil = 1.75
SWEP.RecoilVertical = 1
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 1)
SWEP.Spread = 1 / 245
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "smg1"

SWEP.MagType = "m4a1"
SWEP.DefaultMagazine = "m4a1_30"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_556"
SWEP.BulletEffect = "arcticvr_bullet_556"

SWEP.NextPrimaryFire = 0

SWEP.FireSound = "weapons/m4a1/m4a1_unsil-1.wav"
SWEP.FireSoundSil = "weapons/m4a1/m4a1-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/m4a1_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/m4a1_boltforward.wav"
SWEP.SlideReleaseSound = "weapons/usp/usp_sliderelease.wav"
SWEP.MagInSound = "weapons/arcticvr/m4a1_magin.wav"
SWEP.MagOutSound = "weapons/m4a1/m4a1_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_m4a1 = {
    offsetPos = Vector(10.8, -3.7, 6.5), --forward, left, up
    offsetAng = Angle(10, 0, 0),
}

SWEP.TriggerPulledOffset = { -- the offset of the trigger bone when it is fully pulled.
    pos = Vector(0, 0, -0),
    ang = Angle(0, 0, 15)
}

SWEP.NonReciprocatingChargingHandle = true
SWEP.CanLockBack = true
SWEP.MagCanDropFree = true
SWEP.BoltCanAutoRelease = true

SWEP.TwoHanded = true

SWEP.RecoilTwoHandMult = 0.01

SWEP.ForegripAngle = Angle(0, -60, -90)
SWEP.ForegripOffset = Vector(14.5, -4.3, 0.5)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-3, -2, -3)
SWEP.SlideMaxs = Vector(3, 5, 3)

SWEP.MagazineInsertMins = Vector(-2, -2, -3)
SWEP.MagazineInsertMaxs = Vector(2, 2, 3)

SWEP.MagazineOffset = Vector(-0.5, 0, -5)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.FingerAngles = {
    --right hand open angles
    Angle(-0,-7,-5), Angle(0,40,0), Angle(0,10,0), --finger 0
    Angle(0,35,10), Angle(0,5,0), Angle(0,-7.9,0), --finger 1   This is the index finger, off the trigger
    Angle(0,-20.6,0), Angle(0,-70,0), Angle(0,-37,0), --finger 2
    Angle(0,-30.8,0), Angle(0,-40,0), Angle(0, -50.1,0), --finger 3
    Angle(0,-30.3,-8.2), Angle(0,-40,0), Angle(0,-20.5,0), --finger 4
    --right hand closed angles
    Angle(-0,-7,-5), Angle(0,40,0), Angle(0,10,0), --finger 0
    Angle(-2,25,17), Angle(0,-10,0), Angle(0,-45.9,0), --finger 1   This is the index finger, on the trigger
    Angle(0,-20.6,0), Angle(0,-70,0), Angle(0,-37,0), --finger 2
    Angle(0,-30.8,0), Angle(0,-40,0), Angle(0, -50.1,0), --finger 3
    Angle(0,-30.3,-8.2), Angle(0,-40,0), Angle(0,-20.5,0), --finger 4
}

SWEP.LeftHandFingerAngles = {
    -- open
    Angle(0,0,0), Angle(0,-20,0), Angle(0,0,0), --finger 0
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 1
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 2
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 3
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0),
    -- closed
    Angle(0,-0,0), Angle(20,-0,20), Angle(0,-0,0),
    Angle(0,15,-10), Angle(0,-30,0), Angle(0,-20,0),
    Angle(0,0,-5), Angle(0,-30,0), Angle(0,-0,0),
    Angle(0,0,4.8), Angle(0,-20,0), Angle(0,-10,0),
    Angle(0,10,15.7), Angle(0,-40,0), Angle(0,10,0),
}

SWEP.BurstLength = 0
SWEP.SlideGrabbed = false
SWEP.SlideReleasing = false
SWEP.SlidePos = 0
SWEP.SlideLockedBack = false
SWEP.NeedAnotherTriggerPull = false
SWEP.OpenBolt = false
SWEP.LastSlidePos = 0
SWEP.Firemode = 2 -- 0 = safe, 1 = semi, 2 = auto, negative = burst
SWEP.RecoilAngles = Angle(0, 0, 0)
SWEP.RecoilBlowback = 0

SWEP.SlideLockbackAmount = 3.3
SWEP.SlideBlowbackAmount = 3.4

SWEP.BulletBones = {
    [1] = "bullet"
}

SWEP.Attachments = {
    {
        Bone = "muzzle",
        Slot = "CSmuzz",
    }
}

SWEP.BoneIndices = {
 pistol = 0,
 magazine = 1,
 trigger = 2,
 chandle = 3,
 selector = 4,
 muzzle = 5,
 eject = 6,
 slidelock = 7,
 slide = 8,
 bullet = 9,
 foregrip = 10,
}


SWEP.MiscLerps = {
}

SWEP.TargetMiscLerps = {
}

SWEP.SlidelockActivePose = {
    pos = Vector(0.1, 0, 0),
    ang = Angle(0, 0, 0)
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 179)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 90)}
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
