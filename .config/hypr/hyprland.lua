-- File created: 2026-07-20 14:55:04 CEST (+0200)

-- Faithful Lua translation of hyprland.conf for Hyprland 0.55 using GPT-5.6 sol.

----------------
-- Monitors
----------------

-- Force 165 Hz for this monitor; use preferred settings elsewhere.
hl.monitor({
  output = "desc:Samsung Electric Company LC34G55T H1AK500000",
  mode = "3440x1440@100",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1.5,
})

----------------
-- Environment
----------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")
-- Keep the compositor and ordinary applications on Intel.
hl.env("AQ_DRM_DEVICES", "/dev/dri/intel-igpu")
hl.env("__EGL_VENDOR_LIBRARY_FILENAMES", "/usr/share/glvnd/egl_vendor.d/50_mesa.json")
hl.env("VK_DRIVER_FILES", "/usr/share/vulkan/icd.d/intel_icd.json")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")
hl.env("WLR_DRM_NO_ATOMIC", "1")

----------------
-- Configuration
----------------

hl.config({
  input = {
    -- Effective values from the legacy config: comments truncated its
    -- apparent "us" and "dvp" entries.
    kb_layout = "se, se",
    kb_variant = "nodeadkeys,dvorak",
    kb_model = "",
    kb_options = "caps:swapescape, compose:menu",
    kb_rules = "",

    accel_profile = "flat",
    repeat_delay = 125,
    repeat_rate = 100,
    follow_mouse = 2,
    float_switch_override_focus = 0,
    sensitivity = 1.0,

    touchpad = {
      disable_while_typing = false,
      natural_scroll = false,
    },
  },

  cursor = {
    no_hardware_cursors = true,
  },

  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 0,
    col = {
      active_border = {
        colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
        angle = 45,
      },
      inactive_border = "rgba(59595955)",
    },
    layout = "dwindle",
    allow_tearing = true,
  },

  master = {
    new_status = "slave",
    orientation = "center",
    slave_count_for_center_master = 2,
    mfact = 0.34,
  },

  decoration = {
    rounding = 0,
    blur = {
      enabled = false,
      size = 5,
      passes = 2,
      noise = 0.15,
    },
    active_opacity = 1.0,
    dim_inactive = true,
    dim_strength = 0.1,
  },

  animations = {
    enabled = false,
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    disable_hyprland_logo = true,
    vrr = 0,
  },
})

-- Retained even though animations are globally disabled.
hl.curve("myBezier", {
  type = "bezier",
  points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- The legacy config contains these hy3 settings, but hy3 is not currently
-- loaded. Leaving them active would make Lua reject unknown plugin keys.
-- If hy3 is loaded again, restore this block after loading the plugin:
-- hl.config({
--     plugin = {
--         hy3 = {
--             autotile = {
--                 enable = true,
--                 trigger_width = -1,
--             },
--         },
--     },
-- })

----------------
-- Autostart
----------------

hl.on("hyprland.start", function()
  hl.exec_cmd("/home/ost/scripts/pipewire.sh")
  hl.exec_cmd("waybar")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("dunst")
  hl.exec_cmd("nm-applet --indicator")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprctl setcursor Hyprcursor 24")
  hl.exec_cmd("foot")
end)

----------------
-- Window rules
----------------

hl.window_rule({ name = "float-kitty", match = { class = "^(kitty)$" }, float = true })
hl.window_rule({ name = "float-alacritty", match = { class = "^(alacritty)$" }, float = true })
hl.window_rule({ name = "float-foot", match = { class = "^(foot)$" }, float = true })
hl.window_rule({ name = "float-thunar", match = { class = "^(thunar)$" }, float = true })
hl.window_rule({ name = "float-mousepad", match = { class = "^(mousepad)$" }, float = true })
hl.window_rule({ name = "float-leafpad", match = { class = "^(leafpad)$" }, float = true })
hl.window_rule({ name = "float-dev3", match = { class = "^(.*dev3.*)$" }, float = true })
hl.window_rule({ name = "float-dig", match = { class = "^(.*dig.*)$" }, float = true, immediate = true })
hl.window_rule({ name = "float-odin", match = { class = "^(.*odin.*)$" }, float = true })

hl.window_rule({
  name = "pavucontrol",
  match = { class = "^(.*pavucontrol.*)$" },
  float = true,
  move = { "monitor_w*0.7", "34" },
  size = { "monitor_w*0.3", "monitor_h*0.5" },
})

hl.window_rule({
  name = "network-editor",
  match = { class = "^(.*nm-connection-editor.*)$" },
  float = true,
  move = { "monitor_w*0.7", "34" },
  size = { "monitor_w*0.3", "monitor_h*0.5" },
})

hl.window_rule({
  name = "blueman-manager",
  match = { class = "^(blueman-.*manager.*)$" },
  float = true,
  move = { "monitor_w*0.7", "34" },
  size = { "monitor_w*0.3", "monitor_h*0.5" },
})

hl.window_rule({
  name = "immediate-all-windows",
  match = { class = "(.*)" },
  immediate = true,
})

----------------
-- Keybindings
----------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + tab", hl.dsp.window.cycle_next())

local directions = {
  left = "left",
  right = "right",
  up = "up",
  down = "down",
}

for key, direction in pairs(directions) do
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.swap({ direction = direction }))
  hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ direction = direction }))
end

-- Workspace 10 is bound to key 0.
for workspace = 1, 10 do
  local key = workspace % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))

-- Switch keyboard layout for the Logitech receiver keyboard.
hl.bind(mainMod .. " + backspace", hl.dsp.exec_cmd("hyprctl switchxkblayout logitech-usb-receiver-keyboard next"))

-- Multimedia keys.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([[sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 +5%"]]))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([[sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 -5%"]]))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute 0 toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
