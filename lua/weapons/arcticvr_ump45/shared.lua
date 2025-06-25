AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 25
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
SWEP.PrintName = "VR UMP-45"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil
SWEP.DamageMin = 10
SWEP.DamageMax = 30
SWEP.MaxRange = 6500
SWEP.Penetration = 4
SWEP.MuzzleVelocity = 13000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 3
SWEP.RPM = 600
SWEP.Firemode = 2
SWEP.Recoil = 0.85
SWEP.RecoilVertical = 3
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 245
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "pistol"
SWEP.MagType = "ump45"
SWEP.DefaultMagazine = "ump45_25"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_9x19"
SWEP.BulletEffect = "arcticvr_bullet_9x19"
SWEP.NextPrimaryFire = 0
SWEP.FireSound = "weapons/ump45/ump45-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/mp5_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/mp5_boltforward.wav"
SWEP.SlideReleaseSound = "weapons/ump45/ump45_boltslap.wav"
SWEP.MagInSound = "weapons/ump45/ump45_clipin.wav"
SWEP.MagOutSound = "weapons/arcticvr/mp5_clipout_fast.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_ump45 = {
        offsetPos = Vector(9.8, -3.7, 3), --forward, left, up
        offsetAng = Angle(10, 0, 0),
    }

    SWEP.TriggerPulledOffset = {
        -- the offset of the trigger bone when it is fully pulled.
        pos = Vector(0, 0, -0),
        ang = Angle(0, 0, 15)
    }

    SWEP.NonReciprocatingChargingHandle = true
    SWEP.CanLockBack = false
    SWEP.MagCanDropFree = true
    SWEP.BoltCanAutoRelease = false
    SWEP.CHandleRaise = true
    SWEP.HKSlap = true
    SWEP.TwoHanded = true
    SWEP.RecoilTwoHandMult = 0.01
    SWEP.ForegripAngle = Angle(0, -20, 0)
    SWEP.ForegripOffset = Vector(12.5, -3.9, -1)
    SWEP.ForegripMins = Vector(-4, -4, -4)
    SWEP.ForegripMaxs = Vector(4, 2, 4)
    SWEP.SlideMins = Vector(-3, -2, -1)
    SWEP.SlideMaxs = Vector(4, 5, 5)
    SWEP.MagazineInsertMins = Vector(-2, -2, -3)
    SWEP.MagazineInsertMaxs = Vector(2, 2, 3)
    SWEP.MagazineOffset = Vector(-0.5, 0, -2)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.CHandleRaiseDir = Vector(0, 1, 0)
    SWEP.CHandleRaiseAmount = 1
    SWEP.CHandleRaisedOffset = {
        pos = Vector(0, 0, 0),
        ang = Angle(-32, 0, 0)
    }

    SWEP.SlideLockbackAmount = 2.5
    SWEP.SlideBlowbackAmount = 2.6
    SWEP.FingerAngles = {
        --right hand open angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(0, 35, 10), --finger 1   This is the index finger, off the trigger
        Angle(0, 5, 0),
        Angle(0, -7.9, 0),
        Angle(0, -30.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -37, 0),
        Angle(0, -30.8, 0), --finger 3
        Angle(0, -40, 0),
        Angle(0, -50.1, 0),
        Angle(0, -30.3, -8.2), --finger 4
        Angle(0, -40, 0),
        Angle(0, -20.5, 0),
        --right hand closed angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(-2, 25, 17), --finger 1   This is the index finger, on the trigger
        Angle(0, -43, 0),
        Angle(0, -30.9, 0),
        Angle(0, -30.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -37, 0),
        Angle(0, -30.8, 0), --finger 3
        Angle(0, -40, 0),
        Angle(0, -50.1, 0),
        Angle(0, -30.3, -8.2), --finger 4
        Angle(0, -40, 0),
        Angle(0, -20.5, 0),
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
        Angle(10, -0, 0),
        Angle(0, -0, 20),
        Angle(0, -0, 0),
        Angle(0, -40, -10),
        Angle(0, -60, 0),
        Angle(0, -55, 0),
        Angle(0, -40, -5),
        Angle(0, -60, 0),
        Angle(0, -50, 0),
        Angle(0, -30, 4.8),
        Angle(0, -50, 0),
        Angle(0, -50, 0),
        Angle(0, -20, 15.7),
        Angle(0, -40, 0),
        Angle(0, -20, 0),
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
    SWEP.BulletBones = {
        [1] = "bullet"
    }

    SWEP.BoneIndices = {
        pistol = 0,
        magazine = 1,
        trigger = 2,
        chandle = 3,
        selector = 4,
        muzzle = 5,
        eject = 6,
        slide = 7,
        bullet = 8,
        foregrip = 9,
    }

    SWEP.MiscLerps = {}
    SWEP.TargetMiscLerps = {}
    SWEP.FireSelectPoses = {
        [0] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        },
        [1] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, -61)
            }
        },
        [2] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, -98)
            }
        },
    }

    SWEP.Firemodes = {2, 1, 0}
end