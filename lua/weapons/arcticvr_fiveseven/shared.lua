AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/pistol_fiveseven.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fiveseven.mdl"
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
SWEP.PrintName = "VR Five-seveN"
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil
SWEP.DamageMin = 15
SWEP.DamageMax = 24
SWEP.MaxRange = 6000
SWEP.Penetration = 7
SWEP.MuzzleVelocity = 19500
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 2
SWEP.RPM = 750
SWEP.Firemode = 2
SWEP.Recoil = 0.8
SWEP.RecoilVertical = 4
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 150
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "smg1"
SWEP.MagType = "fiveseven"
SWEP.DefaultMagazine = "fiveseven_20"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_556"
SWEP.BulletEffect = "arcticvr_bullet_556"
SWEP.NextPrimaryFire = 0
SWEP.FireSound = "weapons/fiveseven/fiveseven-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/usp/usp_slideback2.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/p228_slideforward.wav"
SWEP.SlideReleaseSound = "weapons/usp/usp_sliderelease.wav"
SWEP.MagInSound = "weapons/usp/usp_clipin.wav"
SWEP.MagOutSound = "weapons/fiveseven/fiveseven_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_fiveseven = {
        offsetPos = Vector(5, 1.25, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
    }

    SWEP.CanLockBack = true
    SWEP.MagCanDropFree = true
    SWEP.BoltCanAutoRelease = true
    SWEP.SlideMins = Vector(-3, -0.6, -2.5)
    SWEP.SlideMaxs = Vector(3, 4, 7)
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

    SWEP.SlideLockbackAmount = 2.2
    SWEP.SlideBlowbackAmount = 2.1
    SWEP.BoneIndices = {
        mag = 0,
        trigger = 1,
        slide = 2,
        selector = 3,
        bullet = 4,
        muzzle = 5,
        eject = 6,
    }

    SWEP.MiscLerps = {}
    SWEP.TargetMiscLerps = {}
    SWEP.FireSelectPoses = {
        [0] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, -35)
            }
        },
        [1] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        }
    }

    SWEP.Firemodes = {1, 0}
end