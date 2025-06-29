ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "40mm HE Round"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
AddCSLuaFile()
ENT.Model = "models/weapons/arcticvr/40mmnade.mdl"
ENT.Ticks = 0
if SERVER then
    function ENT:Initialize()
        self:SetModel(self.Model)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        local pb_vert = 1
        local pb_hor = 1
        self:PhysicsInitBox(Vector(-pb_vert, -pb_hor, -pb_hor), Vector(pb_vert, pb_hor, pb_hor))
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
            phys:SetMass(1)
        end

        self.Armed = true
        self.SpawnTime = CurTime()
    end
else
    function ENT:Think()
        if self.Ticks % 5 == 0 then
            local emitter = ParticleEmitter(self:GetPos())
            if not self:IsValid() or self:WaterLevel() > 2 then return end
            local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
            smoke:SetVelocity(VectorRand() * 25)
            smoke:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)))
            smoke:SetDieTime(math.Rand(1.5, 2.0))
            smoke:SetStartAlpha(255)
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(0)
            smoke:SetEndSize(100)
            smoke:SetRoll(math.Rand(-180, 180))
            smoke:SetRollDelta(math.Rand(-0.2, 0.2))
            smoke:SetColor(20, 20, 20)
            smoke:SetAirResistance(5)
            smoke:SetPos(self:GetPos())
            smoke:SetLighting(false)
            emitter:Finish()
        end

        self.Ticks = self.Ticks + 1
    end
end

function ENT:Detonate()
    if not self:IsValid() then return end
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())
    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 125, 100, 1, CHAN_AUTO)
    else
        util.Effect("Explosion", effectdata)
        self:EmitSound("phx/explode02.wav", 125, 100, 1, CHAN_AUTO)
    end

    local attacker = self
    if self.Owner:IsValid() then attacker = self.Owner end
    util.BlastDamage(self, attacker, self:GetPos(), 350, 125)
    self:FireBullets({
        Attacker = attacker,
        Damage = 0,
        Tracer = 0,
        Distance = 64,
        Dir = (self:GetAngles() - Angle(0, 90, 0)):Forward(),
        Src = self:GetPos(),
        Callback = function(att, tr, dmg) util.Decal("Scorch", tr.StartPos, tr.HitPos - tr.HitNormal * 16, self) end
    })

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end