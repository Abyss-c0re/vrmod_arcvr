AddCSLuaFile()
function SWEP:InitRT()
    local vm = g_VR.viewModel
    if not vm or not IsValid(vm) or not self.RTScope then return end
    -- Create separate render targets for left and right eyes
    self.RTScopeMatLeft = GetRenderTarget("avr_rtmat_left_" .. self:EntIndex(), self.RTScopeRes, self.RTScopeRes, false)
    self.RTScopeMatRight = GetRenderTarget("avr_rtmat_right_" .. self:EntIndex(), self.RTScopeRes, self.RTScopeRes, false)
end

function SWEP:RTScopeExtra(size)
end

function SWEP:RTScopeFunc(left)
    local vm = g_VR.viewModel
    if not vm or not IsValid(vm) or not self.RTScope then return end
    if not self.RTScopeMatLeft or not self.RTScopeMatRight then self:InitRT() end
    self:DrawRTScope(self, vm, left and self.RTScopeMatLeft or self.RTScopeMatRight, self.RTScopeSurface, left)
end

local shadow = Material("scopes/shadow.png")
function SWEP:DrawRTScope(rts, rtsm, rtmat, rtsurf, left)
    local attid = rtsm:LookupAttachment("scope")
    if not attid then return end
    local ret = rtsm:GetAttachment(attid)
    if not ret then return end
    local pos = ret.Pos
    local ang = rtsm:LocalToWorldAngles(Angle(0, 0, 0))
    pos = pos + -ang:Up() * 1.75
    local eyepos = left and g_VR.eyePosLeft or g_VR.eyePosRight
    local eyedist = (pos - eyepos):Length() + 1
    local size = rts.RTScopeRes
    local fov = rts.RTScopeFOV / eyedist * 12
    local rt = {
        x = 0,
        y = 0,
        w = size,
        h = size,
        angles = ang,
        origin = pos,
        drawviewmodel = false,
        fov = fov,
        aspectratio = left and g_VR.aspectLeft or g_VR.aspectRight, -- Use VR aspect ratios
    }

    local ogscrw = g_VR and g_VR.rtWidth or ScrW()
    local ogscrh = g_VR and g_VR.rtHeight or ScrH()
    local ogrt = render.GetRenderTarget()
    render.PushRenderTarget(rtmat, 0, 0, size, size)
    render.Clear(0, 0, 0, 255, true, true)
    render.RenderView(rt)
    cam.Start2D()
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(rts.RTScopeReticle)
    surface.DrawTexturedRect(0, 0, size, size)
    self:RTScopeExtra(size)
    surface.SetDrawColor(0, 0, 0, 255)
    surface.SetMaterial(shadow)
    surface.DrawTexturedRect(0, 0, size, size) -- Simplified shadow rendering
    cam.End2D()
    render.PopRenderTarget()
    rtsurf:SetTexture("$basetexture", rtmat)
    rtsm:SetSubMaterial(rts.RTScopeSubmatIndex, "effects/avr_rt")
    render.SetRenderTarget(ogrt)
    render.SetViewPort(0, 0, ogscrw, ogscrh)
end

function SWEP:HolosightFunc()
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    if not self.Holosight then return end
    if not ArcticVR.SightPiece or not IsValid(ArcticVR.SightPiece) then
        ArcticVR.SightPiece = ClientsideModel(self.HolosightPiece)
        ArcticVR.SightPiece:SetParent(vm)
        ArcticVR.SightPiece:SetNoDraw(true)
        ArcticVR.SightPiece:AddEffects(EF_BONEMERGE)
    end

    self:DrawHolosight(self, vm, ArcticVR.SightPiece, true)
end

function SWEP:DrawHolosight(hs, hsm, hsp, cullhsm)
    cullhsm = cullhsm or false
    local attid = hsm:LookupAttachment("holosight")
    if attid == 0 then attid = hsm:LookupAttachment("scope") end
    if attid == 0 then return end
    local ret = hsm:GetAttachment(attid)
    local pos = ret.Pos
    local ang = ret.Ang
    local size = hs.HolosightSize
    render.UpdateScreenEffectTexture()
    render.ClearStencil()
    render.SetStencilEnable(true)
    render.SetStencilCompareFunction(STENCIL_ALWAYS)
    render.SetStencilPassOperation(STENCIL_REPLACE)
    render.SetStencilFailOperation(STENCIL_KEEP)
    render.SetStencilZFailOperation(STENCIL_REPLACE)
    render.SetStencilWriteMask(0xFF)
    render.SetStencilTestMask(0xFF)
    render.SetStencilReferenceValue(55)
    render.SetBlend(1)
    hsp:DrawModel()
    render.SetStencilReferenceValue(0)
    for i, k in pairs(self.Attachments) do
        if k.CSModel then k.CSModel:DrawModel() end
    end

    if cullhsm then
        ArcticVR.Overdraw = true
        hsm:DrawModel()
    end

    render.SetStencilReferenceValue(55)
    ArcticVR.Overdraw = false
    render.SetBlend(0)
    render.SetStencilCompareFunction(STENCIL_EQUAL)
    local dir = ang:Up()
    pos = pos + dir * hs.HolosightDist
    local corner1, corner2, corner3, corner4
    corner1 = pos + ang:Right() * -0.5 * size + ang:Forward() * 0.5 * size
    corner2 = pos + ang:Right() * -0.5 * size + ang:Forward() * -0.5 * size
    corner3 = pos + ang:Right() * 0.5 * size + ang:Forward() * -0.5 * size
    corner4 = pos + ang:Right() * 0.5 * size + ang:Forward() * 0.5 * size
    render.SetMaterial(hs.HolosightReticle)
    render.DrawQuad(corner1, corner2, corner3, corner4, Color(255, 255, 255))
    render.SetStencilEnable(false)
end

local lasermat = Material("effects/laser1")
local laserflare = Material("effects/whiteflare")
function SWEP:LaserSightFunc()
    if not self.LaserSight then return end
    local vm = g_VR.viewModel
    if not vm then return end
    if not IsValid(vm) then return end
    self:DrawLaserSight(vm, self)
end

function SWEP:DrawLaserSight(lsm, ls)
    local attid = lsm:LookupAttachment("laser")
    if attid == 0 then attid = lsm:LookupAttachment("muzzle") end
    if attid == 0 then return end
    local ret = lsm:GetAttachment(attid)
    local pos = ret.Pos
    local ang = ret.Ang
    local tr = util.TraceLine({
        start = pos,
        endpos = pos + ang:Up() * 40000,
        filter = self.Owner
    })

    local hit = tr.HitPos
    local didhit = tr.Hit
    local m = ls.LaserStrength or 1
    local col = ls.LaserSightColor
    if tr.StartSolid then return end
    local width = math.Rand(0.5, 2) * m
    cam.Start3D()
    render.SetMaterial(lasermat)
    render.DrawBeam(pos, hit, width, 0, 1, col)
    if didhit then
        local sd = (tr.HitPos - EyePos()):Length()
        local mult = math.log10(sd) * m
        render.SetMaterial(laserflare)
        local r1 = math.Rand(10, 14) * mult
        local r2 = math.Rand(10, 14) * mult
        render.DrawSprite(hit, r1, r2, col)
        render.DrawSprite(hit, r1 * 0.25, r2 * 0.25, Color(255, 255, 255))
    end

    cam.End3D()
end