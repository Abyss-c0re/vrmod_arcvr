AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/sniper_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 20
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
SWEP.PrintName = "VR G3SG1"
SWEP.Slot = 3
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.DamageMin = 65
SWEP.DamageMax = 30
SWEP.MaxRange = 7500
SWEP.Penetration = 20
SWEP.MuzzleVelocity = 55000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.RPM = 450
SWEP.Num = 1
SWEP.Recoil = 3
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 750
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "ar2"
SWEP.MagType = "g3sg1"
SWEP.DefaultMagazine = "g3sg1_20"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_308"
SWEP.BulletEffect = "arcticvr_bullet_308"
SWEP.FireSound = "weapons/g3sg1/g3sg1-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlideBackSound = "weapons/arcticvr/mp5_boltback.wav"
SWEP.SlideReleaseSound = "weapons/arcticvr/aug_boltslap.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/mp5_boltforward.wav"
SWEP.MagInSound = "weapons/g3sg1/g3sg1_clipin.wav"
SWEP.MagOutSound = "weapons/g3sg1/g3sg1_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_g3sg1 = {
        offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
    }

    SWEP.NonReciprocatingChargingHandle = true
    SWEP.CanLockBack = false
    SWEP.MagCanDropFree = false
    SWEP.BoltCanAutoRelease = false
    SWEP.CHandleRaise = true
    SWEP.HKSlap = true
    SWEP.TwoHanded = true
    SWEP.RTScope = true -- weapon has an RT scope
    SWEP.RTScopeSubmatIndex = 0 -- what is the submaterial index of the scope material?
    SWEP.RTScopeFOV = 10 / 4 -- what is the field of view of the scope?
    SWEP.RTScopeRes = 256
    SWEP.RTScopeSurface = Material("effects/avr_rt")
    SWEP.RTScopeOffset = Vector(0, 0, 0)
    SWEP.RTScopeReticle = Material("scopes/tricross.png")
    SWEP.StabilityFrames = 15
    SWEP.ForegripAngle = Angle(0, -90, -90)
    SWEP.ForegripOffset = Vector(16, -4, 3)
    SWEP.ForegripMins = Vector(-4, -9, -5)
    SWEP.ForegripMaxs = Vector(4, 1, 8)
    SWEP.SlideMins = Vector(-4, -6, -4)
    SWEP.SlideMaxs = Vector(4, 6, 6)
    SWEP.MagazineInsertMins = Vector(-3, -4, -3)
    SWEP.MagazineInsertMaxs = Vector(3, 0, 3)
    SWEP.MagazineOffset = Vector(0, 0, 0)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.CHandleRaiseDir = Vector(0, 1, 0)
    SWEP.CHandleRaiseAmount = 1.5
    SWEP.CHandleRaisedOffset = {
        pos = Vector(-0.560389, 0.801493, 0),
        ang = Angle(0, 24.5025, 0)
    }

    SWEP.SlideLockbackAmount = 8.363
    SWEP.SlideBlowbackAmount = 9.03365
    SWEP.BoneIndices = {
        g3sg1 = 0,
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
        root = 11,
    }

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
                ang = Angle(0, 0, -37)
            }
        },
        [2] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, -73)
            }
        },
    }

    SWEP.Firemodes = {2, 1, 0}
end