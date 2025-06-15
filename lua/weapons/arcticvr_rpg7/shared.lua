AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/launcher_rpg7.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_rpg7.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "RPG_Round"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR RPG-7"
SWEP.Slot = 4
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.MuzzleVelocity = 120000
SWEP.ShootEntity = "arcticvr_rpg7_proj"
SWEP.Num = 1
SWEP.Recoil = 5
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 750
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "RPG_Round"

SWEP.MagType = "rpg7rocket"
SWEP.DefaultMagazine = "rpg7rocket_1"

SWEP.FireSound = "weapons/rpg/rocketfire1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.MagOutSound = "weapons/p90/p90_cliprelease.wav"
SWEP.MagInSound = "weapons/p90/p90_clipin.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.DisintegratingMagazine = true

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_rpg7 = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.AlwaysShoot = true
SWEP.OpenBolt = true
SWEP.CanLockBack = true
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false
SWEP.NonAutoloading = false
SWEP.SlideNoAutoReciprocate = true
SWEP.TwoHanded = true

SWEP.RTScope = true -- weapon has an RT scope
SWEP.RTScopeSubmatIndex = 2 -- what is the submaterial index of the scope material?
SWEP.RTScopeFOV = 8 -- what is the field of view of the scope?
SWEP.RTScopeRes = 256
SWEP.RTScopeSurface = Material("effects/avr_rt")
SWEP.RTScopeOffset = Vector(0, 0, 0)
SWEP.RTScopeReticle = Material("scopes/rpg.png")

SWEP.StabilityFrames = 4

SWEP.ForegripAngle = Angle(0, 0, 0)
SWEP.ForegripOffset = Vector(-7.5, -2, 0)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 8)

SWEP.ReverseForegrip = true

SWEP.MagazineInsertMins = Vector(-3, -3, -3)
SWEP.MagazineInsertMaxs = Vector(3, 3, 3)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.BoneIndices = {
    rpg7 = 0,
    mag = 1,
    trigger = 2,
    muzzle = 3,
    foregrip = 4,
    scope = 5,
}


SWEP.Firemodes = {
    1,
}

end