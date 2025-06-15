ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Flash Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/arcticvr/nade_flash.mdl"
ENT.FuseTime = 1.5
ENT.ArmTime = 0
ENT.ImpactFuse = false

AddCSLuaFile()

local function FlashExplosion(flashorigin)
    local flashpower = 1024
    local targets = ents.FindInSphere(flashorigin, flashpower)

    for _, k in pairs(targets) do
        if k:IsPlayer() then
            local dist = k:EyePos():Distance(flashorigin)
            local dp = (k:EyePos() - flashorigin):Dot(k:EyeAngles():Forward())

            local time = Lerp( dp, 5, 0.5 )

            time = Lerp( dist / flashpower, time, 0 )

            if k:VisibleVec( flashorigin ) then
                k:ScreenFade( SCREENFADE.IN, Color( 255, 255, 255, 255 ), 2.5, time )
            end

            k:SetDSP( 37, false )

        elseif k:IsNPC() then

            k:SetNPCState(NPC_STATE_PLAYDEAD)

            if timer.Exists( k:EntIndex() .. "_avr_flashtimer" ) then
                timer.Remove( k:EntIndex() .. "_avr_flashtimer" )
            end

            timer.Create( k:EntIndex() .. "_avr_flashtimer", 10, 1, function()
                if !k:IsValid() then return end
                k:SetNPCState(NPC_STATE_ALERT)
            end)

        end
    end
end

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

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
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_hard" .. math.random(1,3) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_soft" .. math.random(1,3) .. ".wav"))
        end

        if self.at <= CurTime() and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if SERVER and CurTime() >= self.kt then
        self:Detonate()
    end
end

function ENT:Detonate()
    if !self:IsValid() then return end
    local effectdata = EffectData()
        effectdata:SetOrigin( self:GetPos() )

    util.Effect( "arcvr_flashexplode", effectdata)

    FlashExplosion(self:GetPos())

    self:EmitSound("weapons/flashbang/flashbang_explode2.wav", 110, 150, 1, CHAN_AUTO)

    self:Remove()
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end