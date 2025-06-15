
SWEP.Spawnable = true
SWEP.Category = "Arctic VR" -- edit this if you like
SWEP.AdminOnly = false
SWEP.UseHands = false

SWEP.ViewModel = "models/weapons/arcticvr/nade_flash.mdl" -- I mean, you probably have to edit these too
SWEP.WorldModel = "models/weapons/w_eq_flashbang.mdl"

SWEP.ArcticVR = false -- always keep this true
SWEP.ArcticVRNade = true -- always keep this true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1000 -- edit this part just to tell other stuff about the gun. ArcVR doesn't use this data.
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "grenade"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

-- auto switch crap. Edit if you like.
SWEP.Base = "arcticvr_base_nade"
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.PrintName = "VR Flash Grenade" -- you should probably change this
SWEP.Slot = 5 -- you could edit these if you like
SWEP.SlotPos = 2

SWEP.DrawAmmo = false -- irrelevant
SWEP.DrawCrosshair = false

SWEP.ViewModelFOV = 90 -- ALWAYS set to 90

SWEP.ShootEntity = "arcticvr_nade_flash_t" -- set to thrown grenade entity
SWEP.PinModel = "models/weapons/arcticvr/nade_flash_pin.mdl" -- set to released pin
SWEP.SpoonModel = "models/weapons/arcticvr/nade_flash_spoon.mdl" -- set to released spoon

SWEP.ThrowSpeedMult = 100

g_VR.viewModelInfo = g_VR.viewModelInfo or {}

g_VR.viewModelInfo.arcticvr_nade_flash = {
    offsetPos = Vector(3.5, 1.25, 0), --forward, left, up
    offsetAng = Angle(0, 0, 0),
}

SWEP.BoneIndices = {
    root = 0,
    pin = 1,
    spoon = 2,
}
