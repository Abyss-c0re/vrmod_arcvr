AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/shotgun_shorty.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_shot_shorty.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 4
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

SWEP.PrintName = "VR Shorty Shotgun"
SWEP.Slot = 3
SWEP.SlotPos = 4
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.DamageMin = 2
SWEP.DamageMax = 20
SWEP.MaxRange = 2250
SWEP.Penetration = 3
SWEP.MuzzleVelocity = 8000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 2
SWEP.Num = 8
SWEP.RPM = 500
SWEP.Recoil = 4
SWEP.RecoilVertical = 12
SWEP.RecoilSide = 3.5
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 8
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "buckshot"

SWEP.MagType = "12g"
SWEP.DefaultMagazine = "12gshell_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_shell_12g"
SWEP.BulletEffect = "arcticvr_shell_12g"

SWEP.FireSound = "weapons/xm1014/xm1014-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlidePulledSound = ""
SWEP.SlideBackSound = "weapons/arcticvr/m3_slideback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/m3_slideforward.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 4
SWEP.NonAutoloading = true

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_shorty = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.CanLockBack = false
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false
SWEP.PumpAction = true
SWEP.CanDirectChamber = true
SWEP.SlideNoAutoReciprocate = true

SWEP.TwoHanded = true

SWEP.ForegripAngle = Angle(0, -90, -90)
SWEP.ForegripOffset = Vector(12, -4, 1)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-3, -2, -3)
SWEP.SlideMaxs = Vector(6, 2, 3)

SWEP.MagazineInsertMins = Vector(-2, -2, -3)
SWEP.MagazineInsertMaxs = Vector(2, 0, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.SlideBlowbackAmount = 3.365

SWEP.BoneIndices = {
    mag = 1,
    trigger = 2,
    selector = 3,
    chamber = 5,
    slide = 6,
    foregrip = 7,
    bullet = 8,
}

SWEP.FireSelectPoses = {
    [0] = {
        selector = {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
    },
    [1] = {
        selector = {pos = Vector(-0.095, 0, 0), ang = Angle(0, 0, 0)}
    },
}

SWEP.Firemodes = {
    1,
    0
}

end