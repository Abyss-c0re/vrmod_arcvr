ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "RPG-7 Rocket"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
AddCSLuaFile()
ENT.Model = "models/weapons/w_missile_launch.mdl"
ENT.FuseTime = 30
ENT.ArmTime = 0.25
ENT.TrackingAngle = 0.75
ENT.Ticks = 0
if SERVER then
    function ENT:Initialize()
        self:SetModel(self.Model)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
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
            phys:EnableGravity(false)
        end

        self.Armed = true
        self.SpawnTime = CurTime()
        self.MotorSound = CreateSound(self, "weapons/rpg/rocket1.wav")
        self.MotorSound:Play()
    end

    function ENT:OnRemove()
        self.MotorSound:Stop()
    end
end

local images_muzzle = {"effects/muzzleflash1", "effects/muzzleflash2", "effects/muzzleflash3", "effects/muzzleflash4"}
local function TableRandomChoice(tbl)
    return tbl[math.random(#tbl)]
end

function ENT:Think()
    if CLIENT then
        if self.Ticks % 5 == 0 then
            local emitter = ParticleEmitter(self:GetPos())
            if not self:IsValid() or self:WaterLevel() > 2 then return end
            local smoke = emitter:Add("particle/particle_smokegrenade", self:GetPos())
            smoke:SetVelocity(VectorRand() * 25)
            smoke:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-20, -25)))
            smoke:SetDieTime(math.Rand(2.0, 2.5))
            smoke:SetStartAlpha(255)
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(0)
            smoke:SetEndSize(125)
            smoke:SetRoll(math.Rand(-180, 180))
            smoke:SetRollDelta(math.Rand(-0.2, 0.2))
            smoke:SetColor(20, 20, 20)
            smoke:SetAirResistance(5)
            smoke:SetPos(self:GetPos())
            smoke:SetLighting(false)
            emitter:Finish()
        end

        local emitter = ParticleEmitter(self:GetPos())
        local fire = emitter:Add(TableRandomChoice(images_muzzle), self:GetPos())
        fire:SetVelocity(self:GetAngles():Forward() * -1000)
        fire:SetDieTime(0.2)
        fire:SetStartAlpha(255)
        fire:SetEndAlpha(0)
        fire:SetStartSize(16)
        fire:SetEndSize(0)
        fire:SetRoll(math.Rand(-180, 180))
        fire:SetColor(255, 255, 255)
        fire:SetPos(self:GetPos())
        emitter:Finish()
        self.Ticks = self.Ticks + 1
    else
        local phys = self:GetPhysicsObject()
        phys:ApplyForceCenter(self:GetAngles():Forward() * 1250)
    end
end

function ENT:Detonate()
    if not self:IsValid() then return end
    local effectdata = EffectData()
    effectdata:SetOrigin(self:GetPos())
    if self:WaterLevel() >= 1 then
        util.Effect("WaterSurfaceExplosion", effectdata)
        self:EmitSound("weapons/underwater_explode3.wav", 135, 90, 1, CHAN_AUTO)
    else
        util.Effect("Explosion", effectdata)
        self:EmitSound("phx/explode02.wav", 145, 90, 1, CHAN_AUTO)
    end

    local attacker = self
    if self.Owner:IsValid() then attacker = self.Owner end
    util.BlastDamage(self, attacker, self:GetPos(), 256, 70)
    self:FireBullets({
        Attacker = attacker,
        Damage = 500,
        Tracer = 0,
        Distance = 32,
        Dir = self:GetAngles():Forward(),
        Src = self:GetPos(),
        IgnoreEntity = self,
        Callback = function(att, tr, dmg)
            util.Decal("Scorch", tr.StartPos, tr.HitPos - tr.HitNormal * 16, self)
            dmg:SetDamageType(DMG_BLAST)
            if tr.Entity:GetClass() == "npc_helicopter" then dmg:SetDamageType(DMG_AIRBOAT) end
        end
    })

    self:Remove()
end

function ENT:PhysicsCollide(colData, collider)
    self:Detonate()
end

function ENT:Draw()
    self:DrawModel()
end