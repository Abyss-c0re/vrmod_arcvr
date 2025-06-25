AddCSLuaFile()
SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false
SWEP.Base = "arcticvr_base"
SWEP.ViewModel = "models/weapons/arcticvr/smg_thompson.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_thompson.mdl"
SWEP.ArcticVR = true
SWEP.Primary.ClipSize = 30
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
SWEP.PrintName = "VR Thompson"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.DamageMin = 10
SWEP.DamageMax = 38
SWEP.MaxRange = 4500
SWEP.Penetration = 4
SWEP.MuzzleVelocity = 13000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 3
SWEP.RPM = 700
SWEP.Firemode = 2
SWEP.Recoil = 0.95
SWEP.RecoilVertical = 4.75
SWEP.RecoilSide = 4.75
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 125
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "pistol"
SWEP.MagType = "thompson"
SWEP.DefaultMagazine = "thompson_30"
SWEP.OpenBolt = true
SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_9x19"
SWEP.BulletEffect = "arcticvr_bullet_9x19"
SWEP.FireSound = "weapons/mac10/mac10-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/mac10_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/mac10_boltforward.wav"
SWEP.MagInSound = "weapons/tmp/tmp_clipin.wav"
SWEP.MagOutSound = "weapons/tmp/tmp_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_thompson = {
        offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
    }

    SWEP.CanLockBack = true
    SWEP.MagCanDropFree = false
    SWEP.BoltCanAutoRelease = false
    SWEP.TwoHanded = true
    SWEP.ForegripAngle = Angle(0, -90, -90)
    SWEP.ForegripOffset = Vector(14, -4, 1)
    SWEP.ForegripMins = Vector(-4, -6, -2)
    SWEP.ForegripMaxs = Vector(4, 4, 4)
    SWEP.SlideMins = Vector(-6, -3, -3)
    SWEP.SlideMaxs = Vector(2, 3, 6)
    SWEP.MagazineInsertMins = Vector(-3, -4, -3)
    SWEP.MagazineInsertMaxs = Vector(3, 0, 3)
    SWEP.MagazineOffset = Vector(0, 0, 0)
    SWEP.MagazineAngleOffset = Angle(0, 0, 0)
    SWEP.SlideDir = Vector(0, 0, -1)
    SWEP.SlideLockbackAmount = 2.5
    SWEP.SlideBlowbackAmount = 4.375
    SWEP.BoneIndices = {
        mag = 1,
        trigger = 2,
        slide = 3,
        selector = 4,
        bullet = 5,
        muzzle = 6,
        eject = 7,
        foregrip = 8,
        safety = 9,
    }

    SWEP.FireSelectPoses = {
        [0] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            },
            safety = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 179)
            }
        },
        [1] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 179)
            },
            safety = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        },
        [2] = {
            selector = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            },
            safety = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        },
    }

    SWEP.Firemodes = {2, 1, 0}
end