AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/launcher_m32mgl.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_m32mgl.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "SMG1_Grenade"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR M32 MGL"
SWEP.Slot = 4
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false


SWEP.MuzzleVelocity = 12000
SWEP.ShootEntity = "arcticvr_m320_proj"
SWEP.ProjectileOffset = Angle(0, -90, 0)
SWEP.Num = 1
SWEP.Recoil = 7.5
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 750
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "SMG1_Grenade"

SWEP.MagType = "40mmnade"
SWEP.DefaultMagazine = "40mmnade_1"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_357"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_40mm"
SWEP.BulletEffect = "arcticvr_nade_40mm"

SWEP.FireSound = "weapons/grenade_launcher1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.MagInSound = "weapons/xm1014/xm1014_insertshell.wav"
SWEP.MagOutSound = "weapons/357/357_reload4.wav"
SWEP.OpenChamberSound = "weapons/p90/p90_cliprelease.wav"
SWEP.CloseChamberSound = "weapons/p90/p90_clipin.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

SWEP.InternalMagazine = true
SWEP.InternalMagazineCapacity = 6

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_m32mgl = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.TwoHanded = true
SWEP.ForegripOnPivot = true
SWEP.ForegripAngle = Angle(0, 0, 0)
SWEP.ForegripOffset = Vector(18, -2, 1)

SWEP.ForegripMins = Vector(-4, -4, -4)
SWEP.ForegripMaxs = Vector(4, 4, 8)

SWEP.NonAutoloading = true
SWEP.VolleyFire = true
SWEP.VolleyFireAlwaysAdvance = true
SWEP.VolleyFireAutoEject = true
SWEP.VolleyFireAutoEjectUnspent = false
SWEP.VolleyFireAlwaysFromChamberOne = false
SWEP.VolleyFireFromOneBarrel = true

SWEP.BreakAction = true
SWEP.BreakActionOpenAng = Angle(0, 90, 0)
SWEP.BreakActionCloseVector = Vector(0, -1.5, 0)
SWEP.EjectorTapOffset = Vector(0, 0, 1)
SWEP.RevolverBoneRotAxis = Angle(0, 1, 0) -- which axis the revolver cylinder will revolve around
SWEP.VolleyFireRemoveDir = Vector(-1, 0, 0)

SWEP.Holosight = true -- weapon has holo sight
SWEP.HolosightReticle = Material("holosights/m32mgl")
SWEP.HolosightDist = 32
SWEP.HolosightSize = 12
SWEP.HolosightPiece = "models/weapons/arcticvr/launcher_m32mgl_sightpiece.mdl"

SWEP.MagazineInsertMins = Vector(-3, -3, -3)
SWEP.MagazineInsertMaxs = Vector(3, 3, 3)

SWEP.CaseBones = {
    [1] = "chamber1",
    [2] = "chamber2",
    [3] = "chamber3",
    [4] = "chamber4",
    [5] = "chamber5",
    [6] = "chamber6",
}

SWEP.BoneIndices = {
    m32mgl = 0,
    pivot = 1,
    cylinder = 2,
    chamber1 = 3,
    chamber2 = 4,
    chamber3 = 5,
    chamber4 = 6,
    chamber5 = 7,
    chamber6 = 8,
    ejector = 9,
    muzzle = 10,
    foregrip = 11,
    trigger = 12,
    scope = 13,
}

SWEP.Firemodes = {
    1
}

end