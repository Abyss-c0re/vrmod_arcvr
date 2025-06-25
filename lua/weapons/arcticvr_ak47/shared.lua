AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/rifle_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 30
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
SWEP.PrintName = "VR AK-47"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil
SWEP.DamageMin = 20
SWEP.DamageMax = 55
SWEP.MaxRange = 2250
SWEP.Penetration = 15
SWEP.MuzzleVelocity = 200000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.RPM = 550
SWEP.ShotVolume = 30
SWEP.Firemode = 2
SWEP.Recoil = 2.15
SWEP.RecoilVertical = 1.7
SWEP.RecoilSide = 1.25
SWEP.RecoilBalance = Vector(-1, 0, 1)
SWEP.Spread = 1 / 175
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "ar2"
SWEP.MagType = "ak47"
SWEP.DefaultMagazine = "ak47_30"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_762wp"
SWEP.BulletEffect = "arcticvr_bullet_762wp"
SWEP.NextPrimaryFire = 0
SWEP.FireSound = "weapons/ak47/ak47-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/ak47_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/ak47_boltforward.wav"
SWEP.SlideReleaseSound = "weapons/p228/p228_sliderelease.wav"
SWEP.MagInSound = "weapons/ak47/ak47_clipin.wav"
SWEP.MagOutSound = "weapons/ak47/ak47_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_ak47 = {
        offsetPos = Vector(10.8, -3.7, 6.5), --forward, left, up
        offsetAng = Angle(10, 0, 0),
    }

    SWEP.TriggerPulledOffset = {
        -- the offset of the trigger bone when it is fully pulled.
        pos = Vector(0, 0, -0),
        ang = Angle(0, 0, 15)
    }

    SWEP.CanLockBack = false
    SWEP.MagCanDropFree = false
    SWEP.BoltCanAutoRelease = false
    SWEP.CanDirectChamber = false
    SWEP.SafetyBlocksSlide = true
    SWEP.TwoHanded = true
    SWEP.RecoilTwoHandMult = 0.01
    SWEP.ForegripAngle = Angle(0, -60, -90)
    SWEP.ForegripOffset = Vector(16.5, -3.7, -0)
    SWEP.ForegripMins = Vector(-4, -4, -4)
    SWEP.ForegripMaxs = Vector(4, 4, 4)
    SWEP.SlideMins = Vector(-4, -2, -6)
    SWEP.SlideMaxs = Vector(2, 2, 3)
    SWEP.MagazineInsertMins = Vector(-2, -2, -3)
    SWEP.MagazineInsertMaxs = Vector(2, 2, 3)
    SWEP.MagazineOffset = Vector(-0.5, 0, -5)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.FingerAngles = {
        --right hand open angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(0, 35, 10), --finger 1   This is the index finger, off the trigger
        Angle(0, 5, 0),
        Angle(0, -7.9, 0),
        Angle(0, -20.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -37, 0),
        Angle(0, -20.8, 0), --finger 3
        Angle(0, -40, 0),
        Angle(0, -50.1, 0),
        Angle(0, -20.3, -8.2), --finger 4
        Angle(0, -40, 0),
        Angle(0, -30.5, 0),
        --right hand closed angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(-2, 25, 17), --finger 1   This is the index finger, on the trigger
        Angle(0, -5, 0),
        Angle(0, -35.9, 0),
        Angle(0, -20.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -37, 0),
        Angle(0, -20.8, 0), --finger 3
        Angle(0, -40, 0),
        Angle(0, -50.1, 0),
        Angle(0, -20.3, -8.2), --finger 4
        Angle(0, -40, 0),
        Angle(0, -30.5, 0),
    }

    SWEP.LeftHandFingerAngles = {
        -- open
        Angle(0, 0, 0), --finger 0
        Angle(0, -20, 0),
        Angle(0, 0, 0),
        Angle(0, 30, 0), --finger 1
        Angle(0, 10, 0),
        Angle(0, 0, 0),
        Angle(0, 30, 0), --finger 2
        Angle(0, 10, 0),
        Angle(0, 0, 0),
        Angle(0, 30, 0), --finger 3
        Angle(0, 10, 0),
        Angle(0, 0, 0),
        Angle(0, 30, 0),
        Angle(0, 10, 0),
        Angle(0, 0, 0),
        -- closed
        Angle(0, -0, 0),
        Angle(20, -0, 20),
        Angle(0, -0, 0),
        Angle(0, -10, -10),
        Angle(0, -35, 0),
        Angle(0, -25, 0),
        Angle(0, -20, -5),
        Angle(0, -35, 0),
        Angle(0, -0, 0),
        Angle(0, -20, 4.8),
        Angle(0, -35, 0),
        Angle(0, -0, 0),
        Angle(0, -30, 15.7),
        Angle(0, -40, 0),
        Angle(0, 10, 0),
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
    SWEP.SlideLockbackAmount = 3.5
    SWEP.SlideBlowbackAmount = 5
    SWEP.BulletBones = {
        [1] = "bullet"
    }

    SWEP.BoneIndices = {
        pistol = 0,
        magazine = 1,
        trigger = 2,
        slide = 3,
        bullet = 4,
        selector = 5,
        muzzle = 6,
        chamber = 7,
        foregrip = 8,
    }

    SWEP.MiscLerps = {}
    SWEP.TargetMiscLerps = {}
    SWEP.FireSelectPoses = {
        [0] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, -12.4)
            }
        },
        [1] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 6.7)
            }
        },
        [2] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        },
    }

    SWEP.Firemodes = {2, 1, 0}
end