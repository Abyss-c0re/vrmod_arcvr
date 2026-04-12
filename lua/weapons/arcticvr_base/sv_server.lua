AddCSLuaFile()
local shootsys = CreateClientConVar("arcticvr_shootsys", "1", true, FCVAR_ARCHIVE)
function SWEP:Deploy()
    self:SendWeapon(true, false)
    return true
end

function SWEP:Holster()
    return true
end

function SWEP:SendWeapon(justowner, full)
    if justowner and not IsValid(self:GetOwner()) then return end
    net.Start("avr_sendatts")
    net.WriteEntity(self)
    net.WriteUInt(table.Count(self.Attachments), 10)
    for i, k in pairs(self.Attachments) do
        if not k.Installed then
            net.WriteUInt(0, 24)
            continue
        end

        local atttbl = ArcticVR.AttachmentTable[k.Installed]
        local id = atttbl.ID
        net.WriteUInt(id, 24)
    end

    if full then
        net.WriteBool(true)
        net.WriteString(self.Magazine or "")
        net.WriteUInt(self.LoadedRounds, 16)
        net.WriteUInt(self.Chambered, 8)
    else
        net.WriteBool(false)
    end

    if justowner then
        net.Send(self:GetOwner())
    else
        net.Broadcast()
    end
end

function SWEP:VR_Melee(src, vel)
    if CLIENT then return end
    if self.NextMeleeAttack > CurTime() then return end
    if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(true) end
    self:GetOwner():FireBullets({
        Damage = self.MeleeDamage,
        Src = src,
        Dir = vel:GetNormalized(),
        Tracer = 0,
        Distance = 8,
        Force = self.MeleeDamage / 3,
        Callback = function(att, tr, dmg) dmg:SetDamageType(self.MeleeDamageType) end
    })

    if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(false) end
    self.NextMeleeAttack = CurTime() + self.MeleeDelay
end

function SWEP:VR_Shoot(src, ang, cycle)
    if CLIENT then return end
    local num = self:GetAttOverride("Override_Num") or self.Num or 1
    -- === SAFE SPREAD CALCULATION (already fixed the previous crash) ===
    local function GetSpreadScalar(val)
        if not val then return 0 end
        if isvector(val) then
            return (val.x + val.y) / 2 -- average horizontal/vertical spread
        end
        return tonumber(val) or 0
    end

    local baseSpread = GetSpreadScalar(self.Spread)
    local buffSpread = GetSpreadScalar(self:GetBuff("Buff_Spread") or 1)
    local spreadAmount = baseSpread * 0.1 * buffSpread
    -- ==================================================================
    local shootsys = GetConVar("arcticvr_shootsys")
    for i = 1, num do
        local sang = ang + AngleRand() * spreadAmount
        local se = self:GetAttOverride("Override_ShootEntity") or self.ShootEntity
        if se then
            -- === Projectile / Rocket mode ===
            local rocket = ents.Create(se)
            if not rocket:IsValid() then
                print("!!! INVALID ROUND " .. tostring(se))
                return false
            end

            local tr = util.TraceLine({
                start = src,
                endpos = src + sang:Forward() * 50,
                filter = self:GetOwner()
            })

            rocket.ExtraProjectileData = self.ExtraProjectileData or {}
            rocket:SetAngles(sang + (self.ProjectileOffset or Angle(0, 0, 0)))
            rocket:SetPos(tr.HitPos)
            rocket:SetOwner(self:GetOwner())
            rocket:Spawn()
            rocket:Activate()
            constraint.NoCollide(self:GetOwner(), rocket, 0, 0)
            local phys = rocket:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocity(self:GetOwner():GetAbsVelocity())
                phys:SetVelocityInstantaneous(ang:Forward() * self.MuzzleVelocity * self:GetBuff("Buff_MuzzleVelocity"))
            end
        else
            -- === Bullet mode ===
            local tcol = self:GetAttOverride("OverrideTracerCol") or self.TracerCol
            local twidth = self.TracerWidth + self:GetBuffAdditive("Buff_TracerWidth")
            local dmgmin = self.DamageMin * self:GetBuff("Buff_DamageMin")
            local dmgmax = self.DamageMax * self:GetBuff("Buff_DamageMax")
            local sniperized = dmgmin > dmgmax
            if sniperized and self:GetAttOverride("DeSniperize") then
                dmgmin, dmgmax = dmgmax, dmgmin
            elseif not sniperized and self:GetAttOverride("Sniperize") then
                dmgmin, dmgmax = dmgmax, dmgmin
            end

            if shootsys:GetBool() then
                if ArcticVR.IsPhysicalBullets() then
                    ArcticVR:ShootPhysicalBullet(src, sang, self.MuzzleVelocity * self:GetBuff("Buff_MuzzleVelocity"), {
                        c = tcol,
                        w = twidth
                    }, dmgmin, dmgmax, self.MaxRange * self:GetBuff("Buff_MaxRange"), self, self:GetOwner(), self.Penetration * self:GetBuff("Buff_Penetration"), self.ShootCallback)
                else
                    if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(true) end
                    self:GetOwner():FireBullets({
                        Attacker = self:GetOwner(),
                        Damage = (dmgmin + dmgmax) / 2,
                        Force = (dmgmin + dmgmax) / 6,
                        Tracer = 1,
                        Spread = Vector(0, 0, 0), -- ← FIXED: must be a Vector, not a number
                        Src = src,
                        Dir = sang:Forward(),
                        IgnoreEntity = self:GetOwner(),
                        TracerName = self.TracerOverride
                    })

                    if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(false) end
                end
            else
                if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(true) end
                if not ArcticVR.IsPhysicalBullets() then
                    self:GetOwner():FireBullets({
                        Attacker = self:GetOwner(),
                        Damage = (dmgmin + dmgmax) / 2,
                        Force = (dmgmin + dmgmax) / 6,
                        Tracer = 1,
                        Spread = Vector(0, 0, 0), -- ← FIXED: must be a Vector, not a number
                        Src = src,
                        Dir = sang:Forward(),
                        IgnoreEntity = self:GetOwner(),
                        TracerName = self.TracerOverride
                    })

                    if self:GetOwner():IsPlayer() then self:GetOwner():LagCompensation(false) end
                else
                    ArcticVR:ShootPhysicalBullet(src, sang, self.MuzzleVelocity * self:GetBuff("Buff_MuzzleVelocity"), {
                        c = tcol,
                        w = twidth
                    }, dmgmin, dmgmax, self.MaxRange * self:GetBuff("Buff_MaxRange"), self, self:GetOwner(), self.Penetration * self:GetBuff("Buff_Penetration"), self.ShootCallback)
                end
            end
        end
    end

    if not self.NonAutoloading then self:Cycle() end
end