AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/shotgun_sawnoff.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_sawnoff.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 2
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

SWEP.PrintName = "VR Sawn-Off"
SWEP.Slot = 2
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false


SWEP.DamageMin = 2
SWEP.DamageMax = 22
SWEP.MaxRange = 500
SWEP.Penetration = 2
SWEP.MuzzleVelocity = 8000
SWEP.TracerCol = Color(255, 200, 0)
SWEP.TracerWidth = 3
SWEP.Num = 8
SWEP.RPM = 1000
SWEP.Firemode = 2
SWEP.Recoil = 4
SWEP.RecoilVertical = 15
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 0.15
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "buckshot"

SWEP.MagType = "12g"
SWEP.DefaultMagazine = "12gshell_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_shell_12g"
SWEP.BulletEffect = "arcticvr_shell_12g"

SWEP.FireSound = "weapons/xm1014/xm1014-1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.OpenChamberSound = "weapons/p90/p90_cliprelease.wav"
SWEP.CloseChamberSound = "weapons/p90/p90_clipin.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 2

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_sawnoff = {
    offsetPos = Vector(5.5, 1.25, 1.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.NonAutoloading = true
SWEP.TwoStageTrigger = true

SWEP.VolleyFire = true
SWEP.VolleyFireAlwaysAdvance = false
SWEP.VolleyFireAutoEject = true
SWEP.VolleyFireAutoEjectUnspent = false
SWEP.VolleyFireAlwaysFromChamberOne = true
SWEP.VolleyFireFromOneBarrel = false
SWEP.BreakAction = true
SWEP.BreakActionOpenAng = Angle(0, 0, 30)
SWEP.BreakActionCloseVector = Vector(0, 0, 1.5)

SWEP.MagazineInsertMins = Vector(-2, -2, -2)
SWEP.MagazineInsertMaxs = Vector(2, 2, 2)

SWEP.CaseBones = {
    [1] = "chamber1",
    [2] = "chamber2"
}

SWEP.BoneIndices = {
    sawnoff = 0,
    pivot = 1,
    muzzle1 = 2,
    muzzle2 = 3,
    chamber1 = 4,
    chamber2 = 5,
    safety = 6,
    trigger2 = 7,
    trigger = 8,
}


SWEP.Firemodes = {
    1
}

end