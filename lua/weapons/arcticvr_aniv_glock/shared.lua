AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/pistol_glock.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 17
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
SWEP.PrintName = "VR Glock 17"
SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil
SWEP.DamageMin = 15
SWEP.DamageMax = 17
--SWEP.DamageMin = 10
--SWEP.DamageMax = 12
SWEP.MaxRange = 1000
SWEP.Penetration = 2
SWEP.MuzzleVelocity = 200000
SWEP.TracerCol = Color(255, 255, 255)
SWEP.TracerWidth = 10
SWEP.RPM = 700
SWEP.Firemode = 1
SWEP.Recoil = 0.9
SWEP.RecoilVertical = 6
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 105
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "pistol"
SWEP.MagType = "glock"
SWEP.DefaultMagazine = "glock_17_aniv"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_9x19"
SWEP.BulletEffect = "arcticvr_bullet_9x19"
SWEP.NextPrimaryFire = 0
SWEP.FireSound = "weapons/glock/glock18-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/glock/glock_slideback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/p228_slideforward.wav"
SWEP.SlideReleaseSound = "weapons/glock/glock_sliderelease.wav"
SWEP.MagInSound = "weapons/glock/glock_clipin.wav"
SWEP.MagOutSound = "weapons/glock/glock_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_aniv_glock = {
        offsetPos = Vector(-4.9, -4, 1.3), --forward, left, up
        offsetAng = Angle(10, 0, 0),
    }

    SWEP.TriggerPulledOffset = {
        -- the offset of the trigger bone when it is fully pulled.
        pos = Vector(0, 0, -0),
        ang = Angle(0, 0, 15)
    }

    SWEP.CanLockBack = true
    SWEP.MagCanDropFree = true
    SWEP.BoltCanAutoRelease = true
    SWEP.PistolStabilize = false
    SWEP.ReverseForegrip = false
    SWEP.TwoHanded = true
    SWEP.RecoilTwoHandMult = 0.01
    SWEP.ForegripAngle = Angle(0, -0, 0)
    SWEP.ForegripOffset = Vector(0, -3, 0)
    SWEP.ForegripMins = Vector(-7, -4, -2)
    SWEP.ForegripMaxs = Vector(5, 4, 6)
    SWEP.SlideMins = Vector(-3, -0.6, -3.6)
    SWEP.SlideMaxs = Vector(3, 4, 7)
    SWEP.MagazineInsertMins = Vector(-2, -2, -3)
    SWEP.MagazineInsertMaxs = Vector(2, 1, 4)
    SWEP.MagazineOffset = Vector(-1, 0, -3.5)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.FingerAngles = {
        --right hand open angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(-10, 35, 10), --finger 1   This is the index finger, off the trigger
        Angle(0, 5, 0),
        Angle(0, -7.9, 0),
        Angle(-10, 0.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -57, 0),
        Angle(-10, 0.8, 0), --finger 3
        Angle(0, -50, 0),
        Angle(0, -60.1, 0),
        Angle(-10, 0.3, -8.2), --finger 4
        Angle(0, -50, 0),
        Angle(0, -30.5, 0),
        --right hand closed angles
        Angle(-0, -7, -5), --finger 0
        Angle(0, 40, 0),
        Angle(0, 10, 0),
        Angle(-10, 35, 17), --finger 1   This is the index finger, on the trigger
        Angle(0, -5, 0),
        Angle(0, -40.9, 0),
        Angle(-10, 0.6, 0), --finger 2
        Angle(0, -60, 0),
        Angle(0, -57, 0),
        Angle(-10, 0.8, 0), --finger 3
        Angle(0, -50, 0),
        Angle(0, -60.1, 0),
        Angle(-10, 0.3, -8.2), --finger 4
        Angle(0, -50, 0),
        Angle(0, -30.5, 0),
    }

    SWEP.LeftHandFingerAngles = {
        -- open
        Angle(0, 0, 0), --finger 0
        Angle(0, -40, 0),
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
        Angle(0, 0, 0),
        Angle(0, 0, 0),
        Angle(0, 30, 0),
        Angle(0, -5, -10),
        Angle(0, -30, 0),
        Angle(0, -20, 0),
        Angle(0, 5. - 8, 0),
        Angle(0, -30, 0),
        Angle(0, -10, 0),
        Angle(0, 10.5, 4.8),
        Angle(0, -30, 0),
        Angle(0, -10, 0),
        Angle(0, 15, 12.7),
        Angle(0, -30, 0),
        Angle(0, -10, 0),
    }

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
    SWEP.SlideLockbackAmount = 1.3
    SWEP.SlideBlowbackAmount = 1.4
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
        eject = 7,
        slidelock = 8,
        foregrip = 9,
    }

    SWEP.MiscLerps = {}
    SWEP.TargetMiscLerps = {}
    SWEP.SlidelockActivePose = {
        pos = Vector(0, 0.15, 0.06),
        ang = Angle(0, 0, 0)
    }

    SWEP.FireSelectPoses = {
        [1] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 40)
            }
        },
        [-3] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        }
    }

    SWEP.Firemodes = {1, -3, 0}
end