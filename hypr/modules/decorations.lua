-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 10,
        border_size      = 1,

        col              = {
            active_border   = { colors = { "rgba(F9E2AF1C)" } },
            inactive_border = { colors = { "rgba(59595940)" } },
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing    = false,
    },

    decoration = {
        rounding           = 10,
        rounding_power     = 15,

        -- Change transparency of focused and unfocused windows
        active_opacity     = 0.95,
        inactive_opacity   = 0.85,
        fullscreen_opacity = 1.5,

        shadow             = {
            enabled      = true,
            range        = 15,
            render_power = 5,
            colors       = { 0xeef9e2af }, -- Kuning Catppuccin Mocha dengan transparansi
        },

        blur               = {
            enabled  = true,
            size     = 5,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})



-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 2.2,
    bezier = "easeOutQuint",
    style = "slide"
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2.2,
    bezier = "easeOutQuint",
    style = "slide"
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2.2,
    bezier = "easeOutQuint",
    style = "slide"

})

hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.10, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })

hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4.00, bezier = "easeOutQuint", style = "slide top" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2.00, bezier = "easeOutQuint", style = "slide top" })
