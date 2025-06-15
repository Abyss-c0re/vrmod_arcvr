AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/shotgun_m3s90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 8
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

SWEP.PrintName = "VR Benelli M3"
SWEP.Slot = 3
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 2
SWEP.DamageMax = 20
SWEP.MaxRange = 2250
SWEP.Penetration = 3
SWEP.MuzzleVelocity = 200000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 10
SWEP.Num = 8
SWEP.RPM = 500
SWEP.Recoil = 4
SWEP.RecoilVertical = 7
SWEP.RecoilSide = 3.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 15
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "buckshot"

SWEP.MagType = "12g"
SWEP.DefaultMagazine = "12gshell_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_shellspent_cs_12"
SWEP.BulletEffect = "arcticvr_shell_cs_12"

SWEP.FireSound = "weapons/xm1014/xm1014-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/m3_slideback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/m3_slideforward.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 8
SWEP.NonAutoloading = true

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_m3s90 = {
    offsetPos = Vector(0, -3, 1), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.CanLockBack = false
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false
SWEP.PumpAction = true
SWEP.CanDirectChamber = true
SWEP.SlideNoAutoReciprocate = true

SWEP.TwoHanded = true

SWEP.ForegripAngle = Angle(0, -60, -90)
SWEP.ForegripOffset = Vector(20, -3.5, 1)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-3, -2, -3)
SWEP.SlideMaxs = Vector(6, 2, 3)

SWEP.MagazineInsertMins = Vector(-2, -2, -3)
SWEP.MagazineInsertMaxs = Vector(2, 0, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -0.9)

SWEP.SlideBlowbackAmount = 3.7//10.0//3.7

SWEP.DefaultBodygroups = "00001"

SWEP.FingerAngles = {
    --right hand open angles
    Angle(-25,-6.9,-20.1), Angle(0,0,0), Angle(0,60,0), --finger 0
    Angle(-2,35,10), Angle(0,5,0), Angle(0,-7.9,0), --finger 1   This is the index finger, off the trigger
    Angle(0,-13.6,0), Angle(0,-80,0), Angle(0,-27,0), --finger 2
    Angle(0,-15.8,0), Angle(0,-60.6,0), Angle(0,-45.1,0), --finger 3
    Angle(0,-12.3,-8.2), Angle(0,-54.4,0), Angle(0,-22.5,0), --finger 4
    --right hand closed angles
    Angle(-25,-6.9,-20.1), Angle(0,0,0), Angle(0,60,0), --finger 0
    Angle(10,30,15), Angle(0,-30,0), Angle(0,-47.9,0), --finger 1   This is the index finger, on the trigger
    Angle(0,-13.6,0), Angle(0,-80,0), Angle(0,-27,0), --finger 2
    Angle(0,-15.8,0), Angle(0,-60.6,0), Angle(0,-45.1,0), --finger 3
    Angle(0,-12.3,-8.2), Angle(0,-54.4,0), Angle(0,-22.5,0), --finger 4
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

SWEP.BulletBones = {
    [1] = "bullet"
}

SWEP.BoneIndices = {
    mag = 1,
    trigger = 2,
    selector = 3,
    chamber = 5,
    slide = 6,
    foregrip = 7,
    bullet = 8
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    },
    [1] = {
        selector = {pos = Vector(0.095, 0, 0), ang = Angle(0, 0, 0)}
    },
}


SWEP.Firemodes = {
    1,
    0
}

end
