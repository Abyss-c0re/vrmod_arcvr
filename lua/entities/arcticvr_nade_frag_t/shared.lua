ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Frag Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.Model = "models/weapons/arcticvr/nade_frag.mdl"
ENT.FuseTime = 3.5
ENT.ArmTime = 0
ENT.ImpactFuse = false
AddCSLuaFile()
function ENT:Initialize()
    if SERVER then
        self:SetModel(self.Model)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:DrawShadow(true)
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.kt = CurTime() + self.FuseTime
        self.at = CurTime() + self.ArmTime
        self:SetBodygroup(1, 1)
        self:SetBodygroup(2, 1)
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_soft" .. math.random(1, 3) .. ".wav"))
        end

        if self.at <= CurTime() and self.ImpactFuse then self:Detonate() end
    end
end

function ENT:Think()
    if SERVER and CurTime() >= self.kt then self:Detonate() end
end

function ENT:Detonate()
    if SERVER then
        if not self:IsValid() then return end
        local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata)
            self:EmitSound("weapons/underwater_explode3.wav", 120, 100, 1, CHAN_AUTO)
        else
            util.Effect("Explosion", effectdata)
            self:EmitSound("phx/explode01.wav", 120, 100, 1, CHAN_AUTO)
        end

        local attacker = self
        if self.Owner:IsValid() then attacker = self.Owner end
        util.BlastDamage(self, attacker, self:GetPos(), 400, 125)
        self:Remove()
    end
end

function ENT:Draw()
    if CLIENT then self:DrawModel() end
end