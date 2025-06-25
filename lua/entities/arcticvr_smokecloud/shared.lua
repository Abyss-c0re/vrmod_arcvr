ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Smoke Cloud"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.Particles = nil
ENT.BillowTime = 10
ENT.Life = 30
ENT.ArcticVRSmokeCloud = true
AddCSLuaFile()
local SmokeColor = Color(200, 200, 200)
local SmokeRadius = 300
local SmokeImages = {"particle/smokesprites_0001", "particle/smokesprites_0002", "particle/smokesprites_0003", "particle/smokesprites_0004", "particle/smokesprites_0005", "particle/smokesprites_0006", "particle/smokesprites_0007", "particle/smokesprites_0008", "particle/smokesprites_0009", "particle/smokesprites_0010", "particle/smokesprites_0011", "particle/smokesprites_0012", "particle/smokesprites_0013", "particle/smokesprites_0014", "particle/smokesprites_0015", "particle/smokesprites_0016"}
function GetSmokeImage()
    return SmokeImages[math.random(#SmokeImages)]
end

function ENT:Initialize()
    if SERVER then
        self:SetModel("models/weapons/w_eq_smokegrenade_thrown.mdl")
        self:SetMoveType(MOVETYPE_NONE)
        self:SetSolid(SOLID_NONE)
        self:DrawShadow(false)
    else
        local emitter = ParticleEmitter(self:GetPos())
        self.Particles = {}
        for i = 1, 10 do
            local smoke = emitter:Add(GetSmokeImage(), self:GetPos())
            smoke:SetVelocity(VectorRand() * 256)
            smoke:SetDieTime(self.BillowTime)
            smoke:SetStartAlpha(0)
            smoke:SetEndAlpha(255)
            smoke:SetStartSize(0)
            smoke:SetEndSize(SmokeRadius)
            smoke:SetRoll(math.Rand(-180, 180))
            smoke:SetRollDelta(math.Rand(-0.2, 0.2))
            smoke:SetColor(SmokeColor.r, SmokeColor.g, SmokeColor.b)
            smoke:SetAirResistance(75)
            smoke:SetPos(self:GetPos())
            smoke:SetCollide(true)
            smoke:SetBounce(0.2)
            smoke:SetLighting(false)
            smoke:SetNextThink(CurTime() + FrameTime())
            smoke:SetThinkFunction(function(pa)
                if not pa then return end
                local d = pa:GetLifeTime() / pa:GetDieTime()
                local prog = -d ^ 2 + 2 * d
                pa:SetEndSize(SmokeRadius * prog)
                pa:SetStartSize(SmokeRadius * prog)
                pa:SetNextThink(CurTime() + FrameTime())
            end)

            table.insert(self.Particles, smoke)
        end

        emitter:Finish()
    end

    self:EmitSound("weapons/smokegrenade/sg_explode.wav")
    self.bt = CurTime() + self.BillowTime
    self.billowed = false
    self.dt = CurTime() + self.Life + self.BillowTime
end

function ENT:Think()
    if SERVER then
        local targets = ents.FindInSphere(self:GetPos(), 256)
        for _, k in pairs(targets) do
            if k:IsNPC() then k:SetNPCState(NPC_STATE_PRONE) end
        end
    end

    if self.bt < CurTime() and not self.billowed then
        self.billowed = true
        if CLIENT then
            for i, k in pairs(self.Particles) do
                if not k then continue end
                k:SetThinkFunction(function() end)
                k:SetLifeTime(0)
                k:SetDieTime(self.Life)
                k:SetStartAlpha(255)
            end
        end
    end

    if self.dt < CurTime() then
        if CLIENT then
            for i, k in pairs(self.Particles) do
                if not k then continue end
                k:SetLifeTime(0)
                k:SetDieTime(math.Rand(2.5, 5))
                k:SetEndAlpha(0)
            end
        else
            self:Remove()
        end
    end
end

function ENT:Draw()
    return false
end