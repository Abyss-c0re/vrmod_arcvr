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
SWEP.MeleeHitSound = "weapons/knife/knife_hitwall1.wav"
SWEP.MeleeStrikeSound = "weapons/knife/knife_hit1.wav"
SWEP.NotAGun = true
if CLIENT then
    g_VR.viewModelInfo = g_VR.viewModelInfo or {}
    g_VR.viewModelInfo.arcticvr_knife = {
        offsetPos = Vector(3.5, 1, 2.5), --forward, left, up
        offsetAng = Angle(0, 0, 0),
        noLaser = true
    }

    SWEP.BoneIndices = {
        knife = 0,
        bladeend = 1,
        bladestart = 2,
    }
end

function SWEP:Initialize()
    if SERVER then
        hook.Add("VRMod_MeleeHit", "ArcticVR_Knife_Hit_" .. tostring(self:EntIndex()), function(hitData, callback)
            local ply = hitData.Attacker
            if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon() == self then
                callback(nil, "Impact.Metal", -- Custom decal for crowbar
                    nil, -- Keep default damage
                    nil, -- Keep default multiplier (1.25 for blunt)
                    nil, -- Keep default damage type
                    hitData.Reach, -- Keep default reach 
                    hitData.Radius, -- Keep default radius
                    "sharp")
            end
        end)
    end
end

function SWEP:OnRemove()
    hook.Remove("VRMod_MeleeHit", "ArcticVR_Knife_Hit_" .. tostring(self:EntIndex()))
end

-- Prevent default gun click sound
function SWEP:PrimaryAttack()
    -- Do nothing to suppress default firing behavior and click sound
end

-- Prevent default gun click sound
function SWEP:SecondaryAttack()
    -- Do nothing to suppress default firing behavior and click sound
end