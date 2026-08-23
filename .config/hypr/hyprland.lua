-- Monitors

local primaryMonitor  = "eDP-1"
local lgUltragear = "desc:LG Electronics LG ULTRAGEAR 406NTRLC2446"
local lgC4 = "todo"

hl.monitor({
    output   = "eDP-1",
    mode     = "preferred", -- 1920x1080@60
    scale    = 1.25,
    position  = "0x0",
})

hl.monitor({
    output    = lgUltragear,
    mode      = "1920x1080@180",
    position  = "1536x0",
    scale     = 1.25,
    transform = 1,
    disabled  = true,
    vrr       = 1,
})

hl.monitor({
    output    = lgC4,
    mode      = "1920x1080@180",
    position  = "auto-center-left",
    scale     = 1.25,
    transform = 1,
    disabled  = true,
    vrr       = 1,
})

--- Set workspaces to primary monitor

for workspaceIndex = 1, 9 do
    hl.workspace_rule({
        workspace = workspaceIndex,
        monitor = primaryMonitor
    })
end


-- Devices

local trackpad_name = "synaptics-tm3512-010"
local trackpad_enabled = false

hl.device({
    name = trackpad_name,
    enabled = trackpad_enabled,
})


-- Startup

--- Environment variables

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--- Nvidia recommended settings: https://wiki.hypr.land/Nvidia/
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

--- Autolaunch

hl.on("hyprland.start", function ()
  hl.exec_cmd("kitty --hold btop", { workspace = "1" })
  hl.exec_cmd("sleep 0.4 && kitty --hold vim ~/docs/todos/todo", { workspace = "1" })
  hl.exec_cmd("sleep 0.8 && kitty --hold cmus", { workspace = "1" })
  hl.exec_cmd("steam -silent")
end)


-- Look and feel

--- General

hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 0,
        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "master",
    },

    decoration = {
        rounding       = 4,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true, -- You probably want this
    },
    master = {
        new_status = "master",
        mfact = 0.6,
        new_status = "slave",
        focus_master_on_close = true,
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
    ecosystem = {
        no_donation_nag = true
    },
    input = {
        kb_layout  = "gb",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:super", -- capslock maps to super
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
    cursor = {
        no_warps = true,
        inactive_timeout = 5,
    },
    xwayland = {
      force_zero_scaling = true,
    },
    render = {
        direct_scanout = 2,
    }
})

--- Curves and animations

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- Custom functions

--- Firefox: floating PIP resize while maintaing position in lower right
local function pip_resize(scale)
    return function()
        local win = hl.get_window("title:(Picture-in-Picture)")

        if win == nil then return end

        local winCurrentPosX = win.at.x
        local winCurrentPosY = win.at.y
        local winCurrentSizeX = win.size.x
        local winCurrentSizeY = win.size.y

        local winNewPosX = winCurrentPosX - (winCurrentSizeX * (scale - 1))
        local winNewPosY = winCurrentPosY - (winCurrentSizeY * (scale - 1))

        hl.dispatch(
            hl.dsp.window.resize({
                x = winCurrentSizeX * scale,
                y = winCurrentSizeY * scale,
                relative = false,
                window = win,
            })
        )

        hl.dispatch(
            hl.dsp.window.move({
                x = winNewPosX,
                y = winNewPosY,
                relative = false,
                window = win,
            })
        )
    end
end

local function lg_ultragear_toggle()
    return function()
        local isEnabled = hl.get_monitor(lgUltragear) ~= nil
        hl.monitor({ output = lgUltragear, disabled = isEnabled })
    end
end

local function lg_ultragear_rotate()
    return function()
        local monitor = hl.get_monitor(lgUltragear)
        if monitor == nil then return end

        local transform = monitor.transform
        hl.monitor({ output = lgUltragear, transform = 1 - transform })
    end
end


local function hyprsunset_temperature(delta)
    return function()
        hl.dispatch(hl.dsp.exec_cmd("hyprctl hyprsunset temperature " .. delta))
    end
end

local function trackpad_toggle()
    return function()
        trackpad_enabled = not trackpad_enabled
        hl.device({ name = trackpad_name, enabled = trackpad_enabled })
    end
end

local function monitor_switch()
    return function()
        local isPrimaryEnabled = hl.get_monitor(primaryMonitor) ~= nil
        hl.monitor({ output = primaryMonitor, disabled = isPrimaryEnabled })
        hl.monitor({ output = lgUltragear, disabled = not isPrimaryEnabled })
    end
end

-- Disable hyprsunset filter when fullscreen
hl.on("window.fullscreen", function(window)
  if window.fullscreen == 2 then
    hl.dispatch(hl.dsp.exec_cmd("hyprctl hyprsunset identity"))
  else
    hl.dispatch(hl.dsp.exec_cmd("hyprctl hyprsunset reset identity"))
  end
end)


-- Input

--- Keybindings

local mainMod = "SUPER"

---- Home row: programs and window controls
hl.bind(mainMod .. ' + G', hl.dsp.workspace.toggle_special('scratchpad'))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

----- Lock / log out
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

--- Monitor and devices
hl.bind(mainMod .. " + F1", lg_ultragear_toggle())
hl.bind(mainMod .. " + F2", lg_ultragear_rotate())
hl.bind(mainMod .. " + F3", hyprsunset_temperature("-500"))
hl.bind(mainMod .. " + F4", hyprsunset_temperature("+500"))
hl.bind(mainMod .. " + F5", trackpad_toggle())
hl.bind(mainMod .. " + F6", monitor_switch())

--- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim $(xdg-user-dir DOWNLOAD)/screenshots/$(date --utc +%Y%m%d_%H%M%SZ).png")) -- full
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grim -g \"$(slurp -o)\" $(xdg-user-dir DOWNLOAD)/screenshots/$(date --utc +%Y%m%d_%H%M%SZ).png")) -- region

--- Switch workspaces, send windows to workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

--- Move window focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

--- Resize windows
local windowResizePixels = 60
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -windowResizePixels, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = windowResizePixels, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -windowResizePixels, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = windowResizePixels, relative = true }), { repeating = true })

--- Re-arrange windows
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "down" }))

--- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))

--- Multimedia additional keys
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("playerctl position 0"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("playerctl stop"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + N", pip_resize(0.9))
hl.bind(mainMod .. " + M", pip_resize(1.1))


-- Windows and Workspaces

--- Scratchpad workspace
hl.workspace_rule({
  workspace = 'special:scratchpad',
  monitor = primaryMonitor,
  layout = "scrolling",
  gaps_out = 100,
  border_size = 1,
  decorate = true,
  on_created_empty = 'kitty',
})

hl.window_rule({
    name  = "scratchpad-opacity",
    match = {
      workspace = "special:scratchpad",
    },
    opacity = "0.75",
})

--- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

--- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

--- Prevent hypridle lock on any fullscreen window
hl.window_rule({
    name  = "hypridle-fullscreen-no-lock",
    idle_inhibit = "fullscreen",
    match = { class = ".*" },
})

--- Turn off decoration when only one window in workspace (excluding scratchpad)
hl.window_rule {
  name = "exclusive-disable-decoration",
  decorate = false,
  match = { workspace = "w[t1]s[false]" },
}

--- Firefox: floating PIP (https://github.com/hyprwm/Hyprland/issues/2942)
hl.window_rule {
  name = "firefox-floating-pip",
  size = { 512,  288 },
  move = "((monitor_w*1)-window_w-20) ((monitor_h*1)-window_h-20)",
  pin = true,
  float = true,
  match = { title = "(Picture-in-Picture)" },
}

--- Steam: fullscreen launched games
hl.window_rule {
  name = "steam-fullscreen-games",
  tile = true,
  fullscreen = true,
  idle_inhibit = fullscreen,
  match = { class = "^steam_app_[0-9]+$" },
}

--- VisualPinball: playfield on external, DMD on primary
hl.window_rule {
  name = "vpx-playfield",
  monitor = lgUltragear,
  match = { title = "Visual Pinball Player" },
}

hl.window_rule {
  name = "vpx-dmd-1",
  monitor = primaryMonitor,
  dim_around = true,
  match = { title = "PinMAME" },
}

hl.window_rule {
  name = "vpx-dmd-2",
  monitor = primaryMonitor,
  match = { title = "FlexDMD" },
}

--- Pinball FX3: game on external
hl.window_rule {
  name = "pinball-fx3",
  monitor = lgUltragear,
  fullscreen = true,
  match = { title = "Pinball FX Classic" },
}
