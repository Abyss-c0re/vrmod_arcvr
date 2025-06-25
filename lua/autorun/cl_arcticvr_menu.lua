if SERVER then return end
local function InjectArcVRMenu()
    -- Wait until vrmod.GetConvars is available
    if not vrmod or not vrmod.GetConvars then
        timer.Simple(0.1, InjectArcVRMenu)
        return
    end

    -- Ensure this executes after other menu tabs are added
    timer.Simple(0, function()
        hook.Add("VRMod_Menu", "addarcvr", function(frame)
            if not ConVarExists("arcticvr_virtualstock") then return end
            local function AddCheckbox(panel, y, text, convar)
                local cb = panel:Add("DCheckBoxLabel")
                cb:SetPos(25, y)
                cb:SetText(text)
                cb:SetConVar(convar)
                cb:SizeToContents()
                return cb
            end

            local function AddSlider(panel, y, w, h, text, convar, min, max, decimals)
                local s = vgui.Create("DNumSlider", panel)
                s:SetPos(25, y)
                s:SetSize(w, h)
                s:SetText(text)
                s:SetMin(min)
                s:SetMax(max)
                s:SetDecimals(decimals)
                s:SetConVar(convar)
                return s
            end

            -- Inject our ArcticVR tab at the end
            local sheet = vgui.Create("DPropertySheet", frame.DPropertySheet)
            frame.DPropertySheet:AddSheet("ArcVR", sheet)
            sheet:Dock(FILL)
            -- Settings1
            local p1 = vgui.Create("DPanel", sheet)
            sheet:AddSheet("Settings1", p1, "icon16/tick.png")
            AddCheckbox(p1, 30, "[arcticvr_grip_with_reloadkey]\nON = Reloadkey... OFF = Boolean_left_secondaryfire", "arcticvr_grip_withreloadkey")
            AddCheckbox(p1, 80, "[mag_bumpreload]\nReload enabled gun by popping magazine with magazine", "arcticvr_mag_bumpreload")
            AddCheckbox(p1, 130, "[frontgrip alternative mode]\nLeftpickup works only with reload or left_secondary_fire", "arcticvr_grip_alternative_mode")
            AddSlider(p1, 190, 320, 50, "[slide_magnification]\nHigher allows cocking farther away", "arcticvr_slide_magnification", 1, 10, 2)
            AddSlider(p1, 250, 320, 50, "[arcticvr_grip_magnification]\nLarger value = more grip sensitivity", "arcticvr_grip_magnification", 1, 10, 2)
            AddCheckbox(p1, 310, "[arcticvr_disable_reload_with_key]", "arcticvr_disable_reloadkey")
            AddCheckbox(p1, 330, "[arcticvr_disable_grabreload]", "arcticvr_disable_grabreload")
            -- Settings2
            local p2 = vgui.Create("DPanel", sheet)
            sheet:AddSheet("Settings2", p2, "icon16/tick.png")
            AddCheckbox(p2, 10, "[ArcticVR Virtualstock]\nHelps stabilize sight with shoulder stock", "arcticvr_virtualstock")
            AddSlider(p2, 70, 320, 70, "[Frontgrip_Power]\nLeft-hand movement influence on sight", "arcticvr_2h_sens", 0, 2, 2)
            AddCheckbox(p2, 150, "[Grenade_pin_enable]\nThrow grenades without pin when unchecked", "arcticvr_grenade_pin_enable")
            AddCheckbox(p2, 220, "[Shoot System Fix]\nFix shotgun sights; may break some weapons", "arcticvr_shootsys")
            AddCheckbox(p2, 270, "[test_cl_misc_fix]\nEnable for magazine removal issues", "arcticvr_test_cl_misc_fix")
            -- MagPouch
            local p4 = vgui.Create("DPanel", sheet)
            sheet:AddSheet("MagPouch", p4, "icon16/briefcase.png")
            AddSlider(p4, 10, 320, 25, "Default Pouch Distance", "arcticvr_defpouchdist", 0, 200, 2)
            AddCheckbox(p4, 40, "[hybridpouch]", "arcticvr_hybridpouch")
            AddSlider(p4, 55, 320, 25, "Hybrid Pouch Distance", "arcticvr_hybridpouchdist", 0, 200, 1)
            AddCheckbox(p4, 85, "[headpouch]", "arcticvr_headpouch")
            AddSlider(p4, 100, 320, 25, "Head Pouch Distance", "arcticvr_headpouchdist", 0, 200, 1)
            AddCheckbox(p4, 130, "[infinity range pouch]", "arcticvr_infpouch")
            -- Server Settings
            local p5 = vgui.Create("DPanel", sheet)
            sheet:AddSheet("Server", p5, "icon16/tick.png")
            AddCheckbox(p5, 60, "[arcticvr_allgun_allow_reloadkey]", "arcticvr_allgun_allow_reloadkey")
            AddCheckbox(p5, 80, "[arcticvr_allgun_allow_reloadkey_client]", "arcticvr_allgun_allow_reloadkey_client")
            AddCheckbox(p5, 100, "[arcticvr_bumpreload_allgun]", "arcticvr_bumpreload_allgun")
            AddCheckbox(p5, 120, "[arcticvr_bumpreload_allgun_client]", "arcticvr_bumpreload_allgun_client")
            AddCheckbox(p5, 140, "[defaultammo_normalize]", "arcticvr_defaultammo_normalize")
            AddCheckbox(p5, 160, "[alternative_phys_bullet]", "arcticvr_physical_bullets")
            AddSlider(p5, 200, 320, 90, "[mag pickup delay]\nRaise by ~0.01 if clients can't attach mags", "arcticvr_net_magtimertime", 0, 1, 2)
        end)
    end)
end

-- Start the injection process
InjectArcVRMenu()