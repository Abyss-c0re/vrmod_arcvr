AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/sniper_m1903.mdl"
SWEP.WorldModel = "models/weapons/w_spring.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 5
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
SWEP.PrintName = "VR M1903 Springfield"
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.DamageMin = 120
SWEP.DamageMax = 60
SWEP.MaxRange = 7000
SWEP.Penetration = 21
SWEP.MuzzleVelocity = 50000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.Firemode = 1
SWEP.Num = 1
SWEP.Recoil = 4
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 500
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "ar2"
SWEP.MagType = "3006round"
SWEP.DefaultMagazine = "3006round_1"
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_308"
SWEP.BulletEffect = "arcticvr_bullet_308"
SWEP.FireSound = "weapons/arcticvr/spring_shoot.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.BoltUpSound = "weapons/arcticvr/scout_boltup.wav"
SWEP.SlideBackSound = "weapons/arcticvr/scout_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/scout_boltforward.wav"
SWEP.MagInSound = "weapons/arcticvr/k98_clipin2.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 5
SWEP.NonAutoloading = true
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_m1903 = {
        offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
    }

    SWEP.CanLockBack = false
    SWEP.MagCanDropFree = false
    SWEP.BoltCanAutoRelease = false
    SWEP.SlideNoAutoReciprocate = true
    SWEP.NonReciprocatingChargingHandle = true
    SWEP.CHandleRaiseAtStart = true
    SWEP.TwoHanded = true
    SWEP.CanDirectChamber = true
    SWEP.MustBeOpenToLoad = true
    SWEP.RTScope = true -- weapon has an RT scope
    SWEP.RTScopeSubmatIndex = 1 -- what is the submaterial index of the scope material?
    SWEP.RTScopeFOV = 10 / 4 -- what is the field of view of the scope?
    SWEP.RTScopeRes = 256
    SWEP.RTScopeSurface = Material("effects/avr_rt")
    SWEP.RTScopeOffset = Vector(0, 0, 0)
    SWEP.RTScopeReticle = Material("scopes/simplecross.png")
    SWEP.StabilityFrames = 15
    SWEP.ForegripAngle = Angle(0, -90, -90)
    SWEP.ForegripOffset = Vector(17, -4, 3)
    SWEP.ForegripMins = Vector(-4, -4, -9)
    SWEP.ForegripMaxs = Vector(4, 4, 4)
    SWEP.SlideMins = Vector(-8, -2, -4)
    SWEP.SlideMaxs = Vector(2, 2, 4)
    SWEP.MagazineInsertMins = Vector(-2, 0, -3)
    SWEP.MagazineInsertMaxs = Vector(2, 3, 3)
    SWEP.MagazineOffset = Vector(0, 0, 0)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.CHandleBone = "bhandle"
    SWEP.CHandleRaiseAmount = 1.5
    SWEP.CHandleRaisedOffset = {
        pos = Vector(0, 0, 0),
        ang = Angle(0, 75, 0)
    }

    SWEP.SlideBlowbackAmount = 4.5
    SWEP.BoneIndices = {
        m1903 = 0,
        mag = 1,
        trigger = 2,
        slide = 3,
        bullet = 4,
        safety = 5,
        bhandle = 6,
        chandle = 7,
        muzzle = 8,
        chamber = 9,
        scope = 10,
        foregrip = 11,
        sling1 = 12,
        sling2 = 13,
    }

    SWEP.FireSelectPoses = {
        [1] = {
            safety = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        },
        [0] = {
            safety = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, -90, 0)
            }
        },
    }

    SWEP.Firemodes = {1, 0}
end