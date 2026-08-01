AddCSLuaFile()
local cv_lefthandmax_mode = CreateClientConVar("arcticvr_test_cl_misc_fix", "1", FCVAR_ARCHIVE)
function SWEP:VRDeploy()
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    vm:SetupBones()
    vm:SetSubMaterial()
    local tmp = self.FingerAngles
    for i = 1, 15 do
        g_VR.openHandAngles[15 + i] = tmp[i]
        g_VR.closedHandAngles[15 + i] = tmp[15 + i]
    end

    tmp = self.LeftHandFingerAngles
    for i = 1, 15 do
        g_VR.openHandAngles[i] = tmp[i]
        g_VR.closedHandAngles[i] = tmp[15 + i]
    end

    local oldMag = ArcticVR.CSMagazine
    ArcticVR.CSMagazine = nil
    if IsValid(oldMag) then
        oldMag:SetParent(NULL)
        oldMag:Remove()
    end
    SafeRemoveEntity(ArcticVR.SightPiece)
    self:CleanAttModels()
    self:RebuildAttModels()
    self.ForegripGrabbed = false
    if self.Magazine ~= nil then
        local mag = ArcticVR.MagazineTable[self.Magazine]
        if not mag or not mag.Model then return end
        local csm = ClientsideModel(mag.Model)
        if IsValid(csm) then
            csm:SetParent(vm)
            csm:SetLocalPos(vector_origin)
            csm:SetLocalAngles(angle_zero)
            csm:SetNoDraw(true)
            csm:AddEffects(EF_BONEMERGE)
            csm:SetupBones()
            ArcticVR.CSMagazine = csm
        end
    end

    for i, k in pairs(self.BoneIndices) do
        if not self.MiscLerps[k] then
            self.MiscLerps[k] = {
                pos = Vector(0, 0, 0),
                ang = Angle(0, 0, 0)
            }
        end
    end

    if self.HolosightReticle then self.HolosightReticle:SetInt("ignorez", 1) end
    for i = 1, self.InternalMagazineCapacity do
        if self.VolleyFireChambers[i] then continue end
        self.VolleyFireChambers[i] = 0
    end

    if not self.ClientInitialized then self:Initialize() end
end

function SWEP:VRHolster()
    local oldMag = ArcticVR.CSMagazine
    ArcticVR.CSMagazine = nil
    if IsValid(oldMag) then
        oldMag:SetParent(NULL)
        oldMag:Remove()
    end
    SafeRemoveEntity(ArcticVR.SightPiece)
    self:CleanAttModels()
end

function SWEP:UngripForegrip()
    self.ForegripGrabbed = false
    if g_VR then g_VR.foregripActive = false end
    tmp = self.LeftHandFingerAngles
    for i = 1, 15 do
        g_VR.openHandAngles[i] = tmp[i]
        g_VR.closedHandAngles[i] = tmp[15 + i]
    end
end

function SWEP:GripForegrip()
    self.ForegripGrabbed = true
    if g_VR then g_VR.foregripActive = true end
    self.SlideGrabOffset = self.ForegripOffset[1]
    ArcticVR.StabilityFrames = {}
    ArcticVR.StabilityFrameIndex = 1
    if self.ForegripOnPivot then self:CloseChambers() end
    tmp = self.LeftHandFingerAngles
    for i = 1, 15 do
        g_VR.openHandAngles[i] = tmp[15 + i]
        g_VR.closedHandAngles[i] = tmp[15 + i]
    end
end

--- True when LH is in the magazine insert volume (must beat foregrip).
function SWEP:LeftHandInMagazineZone()
    local magbone = self.BoneIndices and (self.BoneIndices.mag or self.BoneIndices.magazine)
    if not magbone then return false end
    if self.Magazine then
        local magtbl = ArcticVR and ArcticVR.MagazineTable and ArcticVR.MagazineTable[self.Magazine]
        if magtbl and magtbl.IsBeltBox then
            magbone = self.BoneIndices.box or magbone
        end
    end
    local mins = self.MagazineInsertMins or Vector(-3, -8, -3)
    local maxs = self.MagazineInsertMaxs or Vector(3, 0, 3)
    return self:LeftHandInMaxs(magbone, mins, maxs) and true or false
end

--- LH near ForegripOffset in right-hand axes (works when bone matrices missing).
--- Keep radius tight so mag / pouch / world grabs are not stolen (was 16–18).
function SWEP:LeftHandNearForegrip(radius)
    radius = radius or 9
    local track = g_VR and g_VR.tracking and g_VR.tracking.pose_lefthand
    local rh = g_VR and g_VR.tracking and g_VR.tracking.pose_righthand
    if not (track and track.pos and rh and rh.pos and rh.ang) then return false end
    local off = self.ForegripOffset or Vector(12, -2, 0)
    local fg = rh.pos + rh.ang:Forward() * (off.x or 0) + rh.ang:Right() * (off.y or 0) + rh.ang:Up() * (off.z or 0)
    return track.pos:DistToSqr(fg) <= (radius * radius)
end

--- Foregrip hit-test only: mag zone never counts; bone OBB first; tight world offset.
function SWEP:LeftHandInForegrip(mins, maxs)
    -- Mag grab wins over two-hand grip when hand is at the magwell
    if self.LeftHandInMagazineZone and self:LeftHandInMagazineZone() then
        return false
    end
    local mag = 1
    local cv = GetConVar("arcticvr_grip_magnification")
    if cv then mag = math.max(cv:GetFloat(), 0.25) end
    -- Cap mag so user can't open a huge FG volume that swallows mag/slide
    mag = math.min(mag, 1.35)
    mins = mins or self.ForegripMins or Vector(-4, -4, -4)
    maxs = maxs or self.ForegripMaxs or Vector(4, 4, 4)
    local bone = self.BoneIndices and self.BoneIndices.foregrip
    if bone ~= nil and mins and maxs then
        if self:LeftHandInMaxs(bone, mins * mag, maxs * mag) then return true end
    end
    -- Fallback only when close to ForegripOffset (was 18u — conflicted with mag)
    return self:LeftHandNearForegrip(9)
end

function SWEP:LeftHandInMaxs(bone, mins, maxs)
    -- Workshop report: nil bone / nil tracking → Lua error spam + half-second hitch every button
    -- IMPORTANT: no foregrip world fallback here — that made slide/mag always "hit" near the gun.
    if bone == nil or mins == nil or maxs == nil then return false end
    local vm = g_VR.viewModel
    if not IsValid(vm) then return false end
    local track = g_VR.tracking and g_VR.tracking.pose_lefthand
    if not track or not track.pos or not track.ang then return false end

    pcall(vm.SetupBones, vm)
    local boneMatrix = vm:GetBoneMatrix(bone)
    if not boneMatrix then return false end

    local tl = Vector(3.5, -1.5, 1.2)
    local handWorld = LocalToWorld(tl, Angle(0, 0, 0), track.pos, track.ang)
    local pos = WorldToLocal(handWorld, Angle(0, 0, 0), boneMatrix:GetTranslation(), boneMatrix:GetAngles())
    if not pos then return false end

    return pos.x > mins[1] and pos.x < maxs[1]
        and pos.y > mins[2] and pos.y < maxs[2]
        and pos.z > mins[3] and pos.z < maxs[3]
end

function SWEP:PositionInMaxs(pos, poss, mins, maxs)
    mins = mins + poss
    maxs = maxs + poss
    if pos.x > mins[1] and pos.x < maxs[1] and pos.y > mins[2] and pos.y < maxs[2] and pos.z > mins[3] and pos.z < maxs[3] then return true end
    return false
end

function SWEP:FiremodeSwitch()
    if self.SpecialFiremodeSwitch then
        self:SpecialFiremodeSwitch()
        return
    end

    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    if table.Count(self.Firemodes) == 1 then return end
    self:PlayNetworkedSound(nil, "SwitchModeSound")
    local fmindex = table.KeyFromValue(self.Firemodes, self.Firemode) or 0
    fmindex = fmindex + 1
    if fmindex > #self.Firemodes then fmindex = 1 end
    self.Firemode = self.Firemodes[fmindex]
end

function SWEP:BoneTap(bone, offset, time)
    self.TargetMiscLerps[bone] = offset
    self.BoneTaps[bone] = CurTime() + time
end

function SWEP:MinimumVel(target)
    local vm = g_VR.viewModel
    local vel = g_VR.tracking.pose_righthand.vel / 25
    vel = WorldToLocal(vel, Angle(0, 0, 0), Vector(0, 0, 0), vm:GetAngles())
    local ok = true
    if target[1] > 0 then
        if vel[1] < target[1] then ok = false end
    elseif target[1] < 0 then
        if vel[1] > target[1] then ok = false end
    end

    if target[2] > 0 then
        if vel[2] < target[2] then ok = false end
    elseif target[2] < 0 then
        if vel[2] > target[2] then ok = false end
    end

    if target[3] > 0 then
        if vel[3] < target[3] then ok = false end
    elseif target[3] < 0 then
        if vel[3] > target[3] then ok = false end
    end
    return ok
end

function SWEP:EjectEmptyChambered()
    local vm = g_VR.viewModel
    if self.EmptyChambered > 0 then
        if self.CaseEffect then
            local fx2 = EffectData()
            fx2:SetAttachment(2)
            fx2:SetMagnitude(150)
            fx2:SetNormal(Vector(0, 0, 0))
            fx2:SetEntity(vm)
            util.Effect(self.CaseEffect, fx2)
        end

        self.EmptyChambered = self.EmptyChambered - 1
    end
end