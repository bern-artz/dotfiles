---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "./.config/rofi/type-2/launcher.sh"
local browser     = "brave"
local editor      = "code"
local search      = "fuzzel"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(editor))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Workspaces - cambiar
--hl.bind(mainMod .. " + Z", hl.dsp.focus({ workspace = "-1" }))
--hl.bind(mainMod .. " + X", hl.dsp.focus({ workspace = "+1" }))
--hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "-1" }))
--hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "+1" }))

--screenshot
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))
hl.bind(mainMod .. " + Print",
    hl.dsp.exec_cmd("grim /home/bernad/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"))

-- Infinite desktop / mover y redimensionar ventanas
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("python3 ~/scripts/floating_tile_toggle.py"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", function()
    hl.exec_cmd("python3 ~/scripts/navigate_windows.py left")
    hl.dsp.focus({ direction = "left" })
end, { repeating = true })
hl.bind(mainMod .. " + right", function()
    hl.exec_cmd("python3 ~/scripts/navigate_windows.py right")
    hl.dsp.focus({ direction = "right" })
end, { repeating = true })
hl.bind(mainMod .. " + up", function()
    hl.exec_cmd("python3 ~/scripts/navigate_windows.py up")
    hl.dsp.focus({ direction = "up" })
end, { repeating = true })

hl.bind(mainMod .. " + down", function()
    hl.exec_cmd("python3 ~/scripts/navigate_windows.py down")
    hl.dsp.focus({ direction = "down" })
end, { repeating = true })

--hl.bind(mainMod .. " + ALT + left",  hl.dsp.exec_cmd("python3 ~/scripts/move_window_tiled.py left"))
--hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd("python3 ~/scripts/move_window_tiled.py right"))
--hl.bind(mainMod .. " + ALT + up",    hl.dsp.exec_cmd("python3 ~/scripts/move_window_tiled.py up"))
--hl.bind(mainMod .. " + ALT + down",  hl.dsp.exec_cmd("python3 ~/scripts/move_window_tiled.py down"))

--hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.exec_cmd("python3 ~/scripts/move_window.py left"),  { repeating = true })
--hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("python3 ~/scripts/move_window.py right"), { repeating = true })
--hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.exec_cmd("python3 ~/scripts/move_window.py up"),    { repeating = true })
--hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.exec_cmd("python3 ~/scripts/move_window.py down"),  { repeating = true })

--hl.bind(mainMod .. " + CTRL + left",  hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py left"),  { repeating = true })
--hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py right"), { repeating = true })
--hl.bind(mainMod .. " + CTRL + up",    hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py up"),    { repeating = true })
--hl.bind(mainMod .. " + CTRL + down",  hl.dsp.exec_cmd("python3 ~/scripts/resize_window.py down"),  { repeating = true })

--waybar reload
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("killall waybar && waybar"))

hl.bind("SUPER + X", function()
    if hl.get_workspace("special:minimized") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    else
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
    end
end)

hl.bind("SUPER + F1", function()
    local game_mode = (hl.get_config("animations.enabled") == false)

    if game_mode then
        hl.exec_cmd("hyprctl reload")
        return
    end

    hl.config({
        general = {
            gaps_in = 0,
            gaps_out = 0,              -- Disable gaps
            border_size = 0,
        },

        animations = {
            enabled = false, -- Disable animations
        },

        -- Disable blur, shadow and window rounding
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            rounding = 0,
        }
    })
end)

local function layout_bind(bind_table)
    return function()
        local workspace = hl.get_active_special_workspace() or
            hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

hl.bind("SUPER + ALT + K", layout_bind({
    scrolling = hl.dsp.layout("move -col"), -- Scrolling: swap column with left one
    dwindle   = hl.dsp.layout("swapsplit"), -- Dwindle: swap window split
    monocle   = hl.dsp.layout("cycleprev"), -- Monocle and master: cycle prev window
    master    = hl.dsp.layout("cycleprev"),
}))

hl.bind("SUPER + ALT + comma", layout_bind({
    scrolling = hl.dsp.layout("move +col"),   -- Scrolling: swap column with right one
    dwindle   = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split
    monocle   = hl.dsp.layout("cyclenext"),   -- Monocle and master: cycle next window
    master    = hl.dsp.layout("cyclenext"),
}))

hl.bind(mainMod .. " + ALT + mouse_up", layout_bind({
    mouse = true,
    scrolling = hl.dsp.layout("move +col"),
    repeating = true,
}))

hl.bind(mainMod .. " + ALT + mouse_down", layout_bind({
    mouse = true,
    scrolling = hl.dsp.layout("move -col"),
    repeating = true,
}))

local ws = hl.get_active_workspace()

hl.bind(mainMod .. " + period", function ()
    local current = hl.get_config("general.layout")
    if current == "dwindle" then
        hl.config({ general = { layout = "master" } })
    elseif current == "master" then
        hl.config({ general = { layout = "scrolling" } })
    elseif current == "scrolling" then
        hl.config({ general = { layout = "monocle" } })
    else
        hl.config({ general = { layout = "dwindle" } })
    end
end)

-- Restore lock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

--scrolling plugin
hl.bind("SUPER + TAB", function()
    hl.plugin.scrolloverview.overview("toggle all")
end)

--utilities
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))