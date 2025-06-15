AddCSLuaFile()

SWEP.Spawnable = true
SWEP.Category = "Arctic VR"
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.Base = "arcticvr_base"

SWEP.ViewModel = "models/weapons/arcticvr/melee_knife.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"

SWEP.ArcticVR = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR Knife"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.MeleeAttack = true -- whether this weapon can melee attack
SWEP.MeleeVelThreshold = 3 -- how fast you have to swing
SWEP.MeleeDelay = 0.25
SWEP.MeleeDamage = 10
SWEP.MeleeDamageType = DMG_SLASH

SWEP.MeleeHitSound = "weapons/knife/knife_hitwall1.wav"
SWEP.MeleeStrikeSound = "weapons/knife/knife_hit1.wav"

SWEP.NotAGun = true

if CLIENT then

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_knife = {
    offsetPos = Vector(3.5, 1, 2.5), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.BoneIndices = {
    knife = 0,
    bladeend = 1,
    bladestart = 2,
}

end