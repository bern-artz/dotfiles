--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.layer_rule({
    name      = "notification-animation",
    match     = { namespace = "swaync-control-center" },
    animation = "slide from top"
})

hl.workspace_rule({ workspace = "2", layout_opts = { direction = "right" } })

hl.window_rule({
    name            = "kitty_starting_width",
    match           = { class = "kitty" },
    scrolling_width = 0.5,
})

hl.on("window.title", function(w)
    if w ~= nil and w.title == "foo" then
        hl.dispatch(hl.dsp.window.float({ action = "set" }))
    end
end)

hl.window_rule({
    pseudo = true,
    size = { 950, 1150},
    center = true,
    enabled = false,
    match = {
        class = "kitty",
        title = "kitty",
    },
})

hl.window_rule({
    opacity = 0.75,
    match = {
        class = "code",
    },
})
