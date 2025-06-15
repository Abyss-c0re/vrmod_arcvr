AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/launcher_xm25cdte.mdl"
SWEP.WorldModel = "models/weapons/arcticvr/w_xm25cdte.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = 5
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

SWEP.PrintName = "VR XM25 CDTE"
SWEP.Slot = 4
SWEP.SlotPos = 3
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.MuzzleVelocity = 10000
SWEP.ShootEntity = "arcticvr_xm25_proj"
SWEP.ProjectileOffset = Angle(0, -90, 0)
SWEP.Num = 1
SWEP.Recoil = 4
SWEP.RecoilVertical = 9
SWEP.RecoilSide = 1
SWEP.RecoilBalance = Vector(-1, 0, 0.75)
SWEP.Spread = 1 / 750
SWEP.MeanShotsBetweenJams = 0
SWEP.AmmoType = "SMG1_Grenade"

SWEP.MagType = "xm25cdte"
SWEP.DefaultMagazine = "xm25cdte_5"

SWEP.MuzzleEffect = "CS_MuzzleFlash"
SWEP.CaseEffect = "arcticvr_case_25mm"
SWEP.BulletEffect = "arcticvr_bullet_25mm"

SWEP.FireSound = "weapons/grenade_launcher1.wav"
SWEP.DryFireSound = "weapons/clipempty_pistol.wav"
SWEP.SwitchModeSound = "weapons/ar2/ar2_empty.wav"
SWEP.SlideBackSound = "weapons/arcticvr/famas_boltback.wav"
SWEP.SlideForwardSound = "weapons/arcticvr/famas_boltforward.wav"
SWEP.MagInSound = "weapons/famas/famas_clipin.wav"
SWEP.MagOutSound = "weapons/famas/famas_clipout.wav"
SWEP.SpawnMagSound = "foley/eli_hand_pat.wav"

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_xm25cdte = {
    offsetPos = Vector(5.5, 1.25, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.TriggerPulledOffset = { -- the offset of the trigger bone when it is fully pulled.
    pos = Vector(0, 0, -0.2),
    ang = Angle(0, 0, 0)
}

SWEP.NonReciprocatingChargingHandle = true
SWEP.CanLockBack = false
SWEP.MagCanDropFree = false
SWEP.BoltCanAutoRelease = false
SWEP.CHandleRaise = false
SWEP.HKSlap = false

SWEP.TwoHanded = true

SWEP.RTScope = true -- weapon has an RT scope
SWEP.RTScopeSubmatIndex = 2 -- what is the submaterial index of the scope material?
SWEP.RTScopeFOV = 10 -- what is the field of view of the scope?
SWEP.RTScopeRes = 256
SWEP.RTScopeSurface = Material("effects/avr_rt")
SWEP.RTScopeOffset = Vector(0, 0, 0)
SWEP.RTScopeReticle = Material("scopes/smart.png")

SWEP.ForegripAngle = Angle(0, 0, 0)
SWEP.ForegripOffset = Vector(10.5, -2, 0)

SWEP.ForegripMins = Vector(-4, -6, -4)
SWEP.ForegripMaxs = Vector(4, 4, 4)

SWEP.SlideMins = Vector(-6, -3, -6)
SWEP.SlideMaxs = Vector(6, 3, 6)

SWEP.MagazineInsertMins = Vector(-3, -4, -5)
SWEP.MagazineInsertMaxs = Vector(3, 0, 5)

SWEP.MagazineOffset = Vector(0, 0, 0)
SWEP.MagazineAngleOffset = Angle(0, 0, 0)

SWEP.SlideDir = Vector(0, 0, -1)

SWEP.SlideBlowbackAmount = 8.8

SWEP.BoneIndices = {
    xm25cdte = 0,
    mag = 1,
    trigger = 2,
    chandle = 3,
    muzzle = 4,
    eject = 5,
    foregrip = 6,
    scope = 7,
}


SWEP.Firemodes = {
    1,
}

SWEP.LazeRange = 100

function SWEP:RTScopeExtra(size)
    local vm = g_VR.viewModel

    if !vm then return end
    if !IsValid(vm) then return end

    local attid = vm:LookupAttachment("scope")

    if !attid then return end

    local ret = vm:GetAttachment(attid)
    local pos = ret.Pos
    local ang = vm:LocalToWorldAngles( Angle(0, 0, 0) )

    pos = pos + ang:Right() * self.RTScopeOffset[1]
    pos = pos + ang:Forward() * self.RTScopeOffset[2]
    pos = pos + ang:Up() * self.RTScopeOffset[1]

    local hutom = (1 / 16) * 0.3048

    local lt = util.TraceLine({
        start = pos,
        endpos = pos + (ang:Forward() * 32000),
        filter = self.Owner
    })

    local crange = (lt.HitPos - pos):Length()

    local mrange = math.ceil(crange * hutom)

    crange = math.ceil(crange)

    self.CRange = crange + 64

    if lt.HitSky then
        crange = 0
        mrange = "---"
        self.CRange = 0
    end

    local lrange = math.ceil(self.LazeRange * hutom)

    if lrange == 0 then
        lrange = "INF"
    end

    surface.SetTextColor(Color(229, 227, 30))
    surface.SetFont("AVR_LCD_24_Glow")
    surface.SetTextPos(16, size / 2 - 12)
    surface.DrawText("TGT:" .. tostring(lrange) .. "m")
    surface.SetTextPos(16, (size / 2) + 12)
    surface.DrawText("RNG:" .. tostring(mrange) .. "m")
end

function SWEP:SpecialFiremodeSwitch()
    local vm = g_VR.viewModel

    vm:EmitSound("ui/buttonclick.wav")
    self.LazeRange = math.Clamp(self.CRange, 0, 10000)

    net.Start("avr_laze")
    net.WriteUInt(self.LazeRange, 16)
    net.SendToServer()
end

end