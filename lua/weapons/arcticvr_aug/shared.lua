AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/rifle_aug.mdl"
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 35
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
SWEP.PrintName = "VR AUG A1"
SWEP.Slot = 3
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.DamageMin = 30
SWEP.DamageMax = 60
SWEP.MaxRange = 5000
SWEP.Penetration = 15
SWEP.MuzzleVelocity = 18000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 3
SWEP.RPM = 750
SWEP.Firemode = 2
SWEP.Recoil = 1.35
SWEP.RecoilVertical = 3.0
SWEP.RecoilSide = 2.25
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 200
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "smg1"
SWEP.MagType = "aug"
SWEP.DefaultMagazine = "aug_35"
SWEP.MuzzleEffect = "CS_MuzzleFlash_X"
SWEP.CaseEffect = "arcticvr_case_556"
SWEP.BulletEffect = "arcticvr_bullet_556"
SWEP.FireSound = "weapons/aug/aug-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.BoltUpSound = "weapons/arcticvr/aug_boltup.wav"
SWEP.SlideBackSound = "weapons/arcticvr/aug_boltback.wav"
SWEP.SlideReleaseSound = "weapons/arcticvr/aug_boltslap.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/aug_boltforward.wav"
SWEP.MagInSound = "weapons/aug/aug_clipin.wav"
SWEP.MagOutSound = "weapons/aug/aug_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_aug = {
        offsetPos = Vector(5, 1.25, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
    }

    SWEP.NonReciprocatingChargingHandle = true
    SWEP.CanLockBack = false
    SWEP.MagCanDropFree = false
    SWEP.BoltCanAutoRelease = false
    SWEP.CHandleRaise = true
    SWEP.HKSlap = true
    SWEP.TwoStageTrigger = true
    SWEP.TwoHanded = true
    SWEP.TriggerPulledOffset = {
        -- the offset of the trigger bone when it is fully pulled.
        pos = Vector(0, 0, -0.4),
        ang = Angle(0, 0, 0)
    }

    SWEP.RTScope = true -- weapon has an RT scope
    SWEP.RTScopeSubmatIndex = 0 -- what is the submaterial index of the scope material?
    SWEP.RTScopeFOV = 5 / 2 -- what is the field of view of the scope?
    SWEP.RTScopeRes = 256
    SWEP.RTScopeSurface = Material("effects/avr_rt")
    SWEP.RTScopeOffset = Vector(0, 0, 0)
    SWEP.RTScopeReticle = Material("scopes/circle.png")
    SWEP.ForegripAngle = Angle(0, 0, 0)
    SWEP.ForegripOffset = Vector(10.5, -2, 0)
    SWEP.ForegripMins = Vector(-4, -6, -4)
    SWEP.ForegripMaxs = Vector(4, 4, 4)
    SWEP.SlideMins = Vector(-4, -6, -4)
    SWEP.SlideMaxs = Vector(4, 6, 8)
    SWEP.MagazineInsertMins = Vector(-3, -4, -3)
    SWEP.MagazineInsertMaxs = Vector(3, 0, 3)
    SWEP.MagazineOffset = Vector(0, 0, 0)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.CHandleRaiseDir = Vector(0, 1, 0)
    SWEP.CHandleRaiseAmount = 1.5
    SWEP.CHandleRaisedOffset = {
        pos = Vector(-0.813898, 0.40626, 0),
        ang = Angle(0, 26.2477, 0)
    }

    SWEP.SlideLockbackAmount = 4.8
    SWEP.SlideBlowbackAmount = 5.1
    SWEP.BoneIndices = {
        aug = 0,
        mag = 1,
        trigger = 2,
        chandle = 3,
        selector = 4,
        muzzle = 5,
        eject = 6,
        slide = 7,
        bullet = 8,
        foregrip = 9,
        scope = 10,
    }

    SWEP.FireSelectPoses = {
        [0] = {
            selector = {
                pos = Vector(0, 0, -1),
                ang = Angle(0, 0, 0)
            }
        },
        [1] = {
            selector = {
                pos = Vector(0, 0, -0.58),
                ang = Angle(0, 0, 0)
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