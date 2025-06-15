AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/smg_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 50
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

SWEP.PrintName = "VR P90"
SWEP.Slot = 2
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 15
SWEP.DamageMax = 24
SWEP.MaxRange = 8000
SWEP.Penetration = 8
SWEP.MuzzleVelocity = 22500
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 2
SWEP.RPM = 950
SWEP.Firemode = 2
SWEP.Recoil = 0.65
SWEP.RecoilVertical = 3
SWEP.RecoilSide = 1.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 195
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "smg1"

SWEP.MagType = "p90"
SWEP.DefaultMagazine = "p90_50"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_556"
SWEP.BulletEffect = "arcticvr_bullet_556"

SWEP.FireSound = "weapons/p90/p90-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/mp5_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/mp5_boltforward.wav"
SWEP.MagInSound = "weapons/p90/p90_clipin.wav"
SWEP.MagOutSound = "weapons/p90/p90_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_p90 = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.NonReciprocatingChargingHandle = true
SWEP.CanLockBack = false
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false
SWEP.CHandleRaise = false
SWEP.HKSlap = false
SWEP.TwoStageTrigger = true

SWEP.TwoHanded = true

SWEP.Holosight = true -- weapon has holo sight
SWEP.HolosightReticle = Material("holosights/p90ring")
SWEP.HolosightDist = 32
SWEP.HolosightSize = 5
SWEP.HolosightPiece = "models/weapons/arcticvr/smg_p90_sightpiece.mdl"

SWEP.ForegripAngle = Angle(0, 0, 0)
SWEP.ForegripOffset = Vector(5, -2, 1)

SWEP.ForegripMins = Vector(-4, -5, -3)
SWEP.ForegripMaxs = Vector(4, -1, 5)

SWEP.SlideMins = Vector(-6, -6, -3)
SWEP.SlideMaxs = Vector(6, 6, 6)

SWEP.MagazineInsertMins = Vector(-5, -1, -7)
SWEP.MagazineInsertMaxs = Vector(5, 3, 6)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.SlideBlowbackAmount = 3.52278

SWEP.BoneIndices = {
    p90 = 0,
    mag = 1,
    trigger = 2,
    chandle = 3,
    selector = 4,
    muzzle = 5,
    eject = 6,
    foregrip = 7,
    scope = 8,
}

SWEP.TriggerPulledOffset = { -- the offset of the trigger bone when it is fully pulled.
    pos = Vector(0, 0, -0.4),
    ang = Angle(0, 0, 0)
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, -0.07), ang = Angle(0, 0, 0)}
    },
    [2] = {
        selector = {pos = Vector(0, 0, -0.14), ang = Angle(0, 0, 0)}
    },
}

SWEP.Firemodes = {
    2,
    1,
    0
}

end