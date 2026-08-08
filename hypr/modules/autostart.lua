-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function () 
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("kitty")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("python3 ~/scripts/infinite_desktop_core.py 1.6 > /tmp/infinite-desktop.log 2>&1")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("quickshell")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)
