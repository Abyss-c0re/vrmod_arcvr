if SERVER then return end
local function InjectArcVRMenu()
    if not vrmod or not vrmod.GetConvars then
        timer.Simple(0.1, InjectArcVRMenu)
        return
    end

    hook.Add("VRMod_Menu", "addarcvr", function(frame)
        if not ConVarExists("arcticvr_virtualstock") then return end
        local arcvrPanel = vgui.Create("DScrollPanel", frame.DPropertySheet)
        arcvrPanel:Dock(FILL)
        frame.DPropertySheet:AddSheet("ArcVR", arcvrPanel, "icon16/gun.png")
        function arcvrPanel:Paint(w, h)
            surface.SetDrawColor(234, 234, 234) -- solid white
            surface.DrawRect(0, 0, w, h)
        end

        -- Helper: build a collapsible section with a DForm inside
        local function AddSection(parentList, title, builder)
            local cat = vgui.Create("DCollapsibleCategory", parentList)
            cat:SetLabel(title)
            cat:Dock(TOP)
            cat:DockMargin(0, 0, 0, 5)
            cat:SetExpanded(false)
            -- Create the form inside the category
            local form = vgui.Create("DForm", cat)
            form:Dock(FILL)
            form.Header:SetVisible(false)
            form:InvalidateLayout(true)
            builder(form)
            -- Now set contents so cat knows about it
            cat:SetContents(form)
            return cat
        end

        -- Build sections
        AddSection(arcvrPanel, "Controls", function(f)
            f:CheckBox("Grip with reload key", "arcticvr_grip_withreloadkey")
            f:CheckBox("Magazine bump preload", "arcticvr_mag_bumpreload")
            f:CheckBox("Alternative frontgrip mode", "arcticvr_grip_alternative_mode")
            f:NumSlider("Slide magnification", "arcticvr_slide_magnification", 1, 10, 2)
            f:NumSlider("Grip magnification", "arcticvr_grip_magnification", 1, 10, 2)
            f:CheckBox("Disable reload with key", "arcticvr_disable_reloadkey")
            f:CheckBox("Disable grab reload", "arcticvr_disable_grabreload")
        end)

        AddSection(arcvrPanel, "Virtual Stock & Fixes", function(f)
            f:CheckBox("Enable virtual stock", "arcticvr_virtualstock")
            f:NumSlider("Frontgrip power", "arcticvr_2h_sens", 0, 2, 2)
            f:CheckBox("Grenade pin enable", "arcticvr_grenade_pin_enable")
            f:CheckBox("Shoot system fix", "arcticvr_shootsys")
            f:CheckBox("Misc client fix", "arcticvr_test_cl_misc_fix")
        end)

        AddSection(arcvrPanel, "Mag Pouches", function(f)
            f:NumSlider("Default pouch distance", "arcticvr_defpouchdist", 0, 200, 2)
            f:CheckBox("Hybrid pouch", "arcticvr_hybridpouch")
            f:NumSlider("Hybrid pouch distance", "arcticvr_hybridpouchdist", 0, 200, 1)
            f:CheckBox("Head pouch", "arcticvr_headpouch")
            f:NumSlider("Head pouch distance", "arcticvr_headpouchdist", 0, 200, 1)
            f:CheckBox("Infinite pouch range", "arcticvr_infpouch")
        end)

        AddSection(arcvrPanel, "Server Settings", function(f)
            f:CheckBox("Allow reload key (all guns)", "arcticvr_allgun_allow_reloadkey")
            f:CheckBox("Allow reload key (client)", "arcticvr_allgun_allow_reloadkey_client")
            f:CheckBox("Bump reload (all guns)", "arcticvr_bumpreload_allgun")
            f:CheckBox("Bump reload (client)", "arcticvr_bumpreload_allgun_client")
            f:CheckBox("Normalize default ammo", "arcticvr_defaultammo_normalize")
            f:CheckBox("Alternate physics bullets", "arcticvr_physical_bullets")
            f:NumSlider("Mag pickup delay", "arcticvr_net_magtimertime", 0, 1, 2)
        end)
    end)
end

InjectArcVRMenu()