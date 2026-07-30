AddCSLuaFile()
local cv_bumpreload = CreateClientConVar("arcticvr_mag_bumpreload", "1", true, FCVAR_ARCHIVE)
local cv_bumpreload_allgun = CreateClientConVar("arcticvr_bumpreload_allgun", "0", true, FCVAR_REPLICATED + FCVAR_NOTIFY + FCVAR_ARCHIVE) or false
local cv_bumpreload_allgun_client = CreateClientConVar("arcticvr_bumpreload_allgun_client", "1", true, FCVAR_ARCHIVE)
function SWEP:EjectMagazine(grab)
    if not self.Magazine then return end
    if self.InternalMagazine then return end
    if self.BeltAmountIn >= self.BeltBullets then return end
    local vm = g_VR.viewModel
    grab = grab or false
    local locpos, locang = LocalToWorld(self.MagazineOffset, self.MagazineAngleOffset, vm:GetPos(), vm:GetAngles())
    net.Start("avr_magout")
    net.WriteBool(grab)
    net.WriteVector(locpos)
    net.WriteAngle(locang)
    if grab then
        local pos, ang = g_VR.tracking.pose_lefthand.pos, g_VR.tracking.pose_lefthand.ang
        net.WriteVector(pos)
        net.WriteAngle(ang)
        net.WriteBool(true)
    end

    net.SendToServer()
    if game.SinglePlayer() then self:PlayNetworkedSound(nil, "MagOutSound") end
    local oldMag = ArcticVR.CSMagazine
    ArcticVR.CSMagazine = nil
    if IsValid(oldMag) then
        oldMag:SetParent(NULL)
        oldMag:Remove()
    end
    self.Magazine = nil
    self.LoadedRounds = 0
end

function SWEP:VolleyFireEject(ej_full)
    ej_full = ej_full or false
    if not self.BreakActionChamberOpen then return end
    local vm = g_VR.viewModel
    local ejected = false
    for i = 1, self.InternalMagazineCapacity do
        if self.VolleyFireChambers[i] == 0 then continue end
        local att = vm:LookupAttachment((self.ChamberAtt or "chamber") .. tostring(i))
        local posang = vm:GetAttachment(att)
        local fx = EffectData()
        fx:SetAttachment(att)
        fx:SetMagnitude(150)
        fx:SetNormal(-posang.Ang:Up())
        fx:SetEntity(vm)
        if self.VolleyFireChambers[i] == 1 then
            if self.CaseEffect then util.Effect(self.CaseEffect, fx) end
            self.VolleyFireChambers[i] = 0
            ejected = true
        elseif ej_full then
            if self.BulletEffect then util.Effect(self.BulletEffect, fx) end
            self.VolleyFireChambers[i] = 0
            ejected = true
        end
    end

    if ejected then self:PlayNetworkedSound(nil, "MagOutSound") end
end

function SWEP:InsertMagazineBehaviourVolleyFire()
    if not self.BreakActionChamberOpen then return end
    local leftent = g_VR.heldEntityLeft
    lastinmaxsany = false
    for i = 1, self.InternalMagazineCapacity do
        local inmaxs = self:LeftHandInMaxs(self.BoneIndices["chamber" .. tostring(i)], self.MagazineInsertMins, self.MagazineInsertMaxs)
        -- if inmaxs then
        --     lastinmaxsany = true
        -- end
        -- if lastinmaxsany then continue end
        if self.VolleyFireChambers[i] ~= 0 then continue end
        if inmaxs then
            net.Start("avr_magin")
            net.WriteEntity(leftent)
            net.WriteBool(false)
            net.SendToServer()
            self:PlayNetworkedSound(nil, "MagInSound")
            g_VR.heldEntityLeft.RenderOverride = function(a) return end
            g_VR.heldEntityLeft = nil
            self.VolleyFireChambers[i] = 2
            break
        end
    end
end

local prevlhinmagmaxs = false
function SWEP:InsertMagazineBehaviour()
    local vm = g_VR.viewModel
    local leftent = g_VR.heldEntityLeft
    if not leftent or not leftent.ArcticVR or not leftent.MagType then return end
    local magtbl = ArcticVR.MagazineTable[leftent.MagID]
    if not magtbl then return end
    if magtbl.IsBeltBox then
        if leftent.MagType ~= self.BeltBoxType then return end
    else
        if leftent.MagType ~= self.MagType then return end
    end

    if self.VolleyFire then
        self:InsertMagazineBehaviourVolleyFire()
        return
    end

    if self.MustBeOpenToLoad and self.SlidePos < self.SlideBlowbackAmount then return end
    if self.InternalMagazine and self.LoadedRounds >= self.InternalMagazineCapacity then return end
    if self.InternalMagazine and self.CanDirectChamber and self.Chambered <= 0 and self.SlidePos >= self.SlideLockbackAmount then
        local dcinmaxs = self:LeftHandInMaxs(self.BoneIndices.chamber, self.MagazineInsertMins, self.MagazineInsertMaxs)
        if dcinmaxs then
            net.Start("avr_magin")
            net.WriteEntity(leftent)
            net.WriteBool(true)
            net.SendToServer()
            self:PlayNetworkedSound(nil, self.DirectChamberSound and "DirectChamberSound" or "MagInSound")
            self.Chambered = self.Chambered + 1
            g_VR.heldEntityLeft.RenderOverride = function(a) return end
            g_VR.heldEntityLeft = nil
            -- Enforce NoDraw on active weapon
            local cvwm = GetConVar("vrmod_useworldmodels")
            if not (cvwm and cvwm:GetBool()) then
                local weapon = LocalPlayer():GetActiveWeapon()
                if IsValid(weapon) then weapon:SetNoDraw(true) end
            end
            return
        end
    end

    local magbone = self.BoneIndices.mag or self.BoneIndices.magazine
    if magtbl and magtbl.IsBeltBox then magbone = self.BoneIndices.box end
    if not self:LeftHandInMaxs(magbone, self.MagazineInsertMins * 1.75, self.MagazineInsertMaxs * 1.75) then return end
    if self.Magazine and cv_bumpreload:GetBool() then
        if self.MagCanDropFree or cv_bumpreload_allgun:GetBool() and cv_bumpreload_allgun_client:GetBool() then
            self:EjectMagazine()
            return
        end
    end

    local inmaxs = self:LeftHandInMaxs(magbone, self.MagazineInsertMins, self.MagazineInsertMaxs)
    if prevlhinmagmaxs then
        prevlhinmagmaxs = inmaxs
        return
    end

    prevlhinmagmaxs = inmaxs
    if not inmaxs or self.Magazine then return end
    net.Start("avr_magin")
    net.WriteEntity(leftent)
    net.WriteBool(false)
    net.SendToServer()
    self:PlayNetworkedSound(nil, "MagInSound")
    if self.InternalMagazine then
        self.LoadedRounds = self.LoadedRounds + leftent.Rounds
    else
        self.LoadedRounds = leftent.Rounds
        self.Magazine = leftent.Name
        -- Visual mag on the gun (bone-merged). Must re-create cleanly every insert —
        -- SafeRemoveEntity is deferred; clear the global first so a second insert
        -- never parents to a dying entity or keeps a dead reference.
        local oldMag = ArcticVR.CSMagazine
        ArcticVR.CSMagazine = nil
        if IsValid(oldMag) then
            oldMag:SetParent(NULL)
            oldMag:Remove()
        end
        if IsValid(vm) then
            local mdl = leftent:GetModel()
            if (not mdl or mdl == "") and magtbl and magtbl.Model then
                mdl = magtbl.Model
            end
            if mdl and mdl ~= "" then
                local csm = ClientsideModel(mdl)
                if IsValid(csm) then
                    csm:SetParent(vm)
                    csm:SetLocalPos(vector_origin)
                    csm:SetLocalAngles(angle_zero)
                    -- Match VRDeploy: do NOT SetNoDraw(true) alone — bonemerge draws with parent.
                    -- Still draw explicitly in PostDrawViewModel for reliability under VRMod.
                    csm:SetNoDraw(true)
                    csm:AddEffects(EF_BONEMERGE)
                    csm:SetupBones()
                    ArcticVR.CSMagazine = csm
                end
            end
        end
    end

    if IsValid(g_VR.heldEntityLeft) then
        g_VR.heldEntityLeft.RenderOverride = function() end
    end
    g_VR.heldEntityLeft = nil
    -- Enforce NoDraw on active weapon world model (not when using world-model VM mode)
    local cvwm = GetConVar("vrmod_useworldmodels")
    if not (cvwm and cvwm:GetBool()) then
        local weapon = LocalPlayer():GetActiveWeapon()
        if IsValid(weapon) then weapon:SetNoDraw(true) end
    end
end

function SWEP:PostDrawViewModel()
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    if ArcticVR.CSMagazine and IsValid(ArcticVR.CSMagazine) then
        -- Re-parent if the VR viewmodel was recreated (weapon switch / worldModelVM rebuild)
        if ArcticVR.CSMagazine:GetParent() ~= vm then
            ArcticVR.CSMagazine:SetParent(vm)
            ArcticVR.CSMagazine:AddEffects(EF_BONEMERGE)
        end
        ArcticVR.CSMagazine:DrawModel()
    end
    if ArcticVR.Overdraw then return end
    if isfunction(self.HolosightFunc) then self:HolosightFunc() end
    if isfunction(self.LaserSightFunc) then self:LaserSightFunc() end
    if isfunction(self.AttRender) then self:AttRender() end
    local cvwm = GetConVar("vrmod_useworldmodels")
    if not (cvwm and cvwm:GetBool()) then
        local weapon = LocalPlayer():GetActiveWeapon()
        if IsValid(weapon) then weapon:SetNoDraw(true) end
    end
end

function SWEP:OpenChambers()
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    if not self.BreakActionChamberOpen then
        self:PlayNetworkedSound(nil, "OpenChamberSound")
        self.BreakActionChamberOpen = true
        if self.ForegripOnPivot then self.ForegripGrabbed = false end
    else
        self:CloseChambers()
    end
end

function SWEP:CloseChambers()
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    if not self.BreakActionChamberOpen then return end
    self:PlayNetworkedSound(nil, "CloseChamberSound")
    self.BreakActionChamberOpen = false
end