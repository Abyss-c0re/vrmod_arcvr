AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/shotgun_m1014.mdl"
SWEP.WorldModel = "models/weapons/w_shot_xm1014.mdl"


SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR M1014"
SWEP.Slot = 3
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Chambered = 0
SWEP.LoadedRounds = 0
SWEP.Magazine = nil

SWEP.DamageMin = 2
SWEP.DamageMax = 18
SWEP.MaxRange = 2250
SWEP.Penetration = 3
SWEP.MuzzleVelocity = 200000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 4
SWEP.Num = 8
SWEP.RPM = 400
SWEP.Firemode = 1
SWEP.Recoil = 5
SWEP.RecoilVertical = 3
SWEP.RecoilSide = 3.5
SWEP.RecoilBalance = Vector(-1, 0, 1)
SWEP.Spread = 1 / 25
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "buckshot"

SWEP.MagType = "12g"
SWEP.DefaultMagazine = "12gshell_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_shellspent_offset_cs_12"
SWEP.BulletEffect = "arcticvr_shell_cs_12"

SWEP.NextPrimaryFire = 0

SWEP.FireSound = "weapons/xm1014/xm1014-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/galil_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/galil_boltforward.wav"
SWEP.SlideReleaseSound = "weapons/p228/p228_sliderelease.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.MagOutSound = "weapons/elite/elite_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 6

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_m1014 = {
    offsetPos = Vector(10.3, -3.7, 6), --forward, left, up
    offsetAng = Angle(10, 0, 0),
}

SWEP.TriggerPulledOffset = { -- the offset of the trigger bone when it is fully pulled.
    pos = Vector(0, 0, -0),
    ang = Angle(0, 0, 15)
}

SWEP.CanLockBack = true
SWEP.BoltCanAutoRelease = true
SWEP.CanDirectChamber = true

SWEP.TwoHanded = true

SWEP.RecoilTwoHandMult = 0.01

SWEP.ForegripAngle = Angle(0, -60, -90)
SWEP.ForegripOffset = Vector(18, -3.6, -1.3)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-4, -3, -5)
SWEP.SlideMaxs = Vector(2, 3, 3)

SWEP.MagazineInsertMins = Vector(-2, -2, -3)
SWEP.MagazineInsertMaxs = Vector(2, 0, 3)

SWEP.MagazineOffset = Vector(-0.5, 0, -5)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.FingerAngles = {
    --right hand open angles
    Angle(-10,-20,-5), Angle(0,40,0), Angle(0,60,0), --finger 0
    Angle(0,35,10), Angle(0,5,0), Angle(0,-7.9,0), --finger 1   This is the index finger, off the trigger
    Angle(0,-30.6,0), Angle(0,-60,0), Angle(0,-27,0), --finger 2
    Angle(0,-30.8,0), Angle(0,-40,0), Angle(0, -40.1,0), --finger 3
    Angle(0,-30.3,-8.2), Angle(0,-40,0), Angle(0,-10.5,0), --finger 4
    --right hand closed angles
    Angle(-10,-20,-5), Angle(0,40,0), Angle(0,60,0), --finger 0
    Angle(-2,15,17), Angle(0,-5,0), Angle(0,-45.9,0), --finger 1   This is the index finger, on the trigger
    Angle(0,-30.6,0), Angle(0,-60,0), Angle(0,-27,0), --finger 2
    Angle(0,-30.8,0), Angle(0,-40,0), Angle(0, -40.1,0), --finger 3
    Angle(0,-30.3,-8.2), Angle(0,-40,0), Angle(0,-10.5,0), --finger 4
}

SWEP.LeftHandFingerAngles = {
    -- open
    Angle(0,0,0), Angle(0,-20,0), Angle(0,0,0), --finger 0
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 1
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 2
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0), --finger 3
    Angle(0,30,0), Angle(0,10,0), Angle(0,0,0),
    -- closed
    Angle(0,-0,0), Angle(20,-0,20), Angle(0,-10,0),
    Angle(0,-10,-10), Angle(0,-30,0), Angle(0,-25,0),
    Angle(0,-20,-5), Angle(0,-30,0), Angle(0,-0,0),
    Angle(0,-20,4.8), Angle(0,-30,0), Angle(0,-0,0),
    Angle(0,-20,15.7), Angle(0,-40,0), Angle(0,10,0),
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

SWEP.SlideLockbackAmount = 3.8
SWEP.SlideBlowbackAmount = 4

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



SWEP.MiscLerps = {
}

SWEP.TargetMiscLerps = {
}


SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, -0.58), ang = Angle(0, 0, 0)}
    },
    [1] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    },
}

SWEP.Firemodes = {
    1,
    0
}

end
