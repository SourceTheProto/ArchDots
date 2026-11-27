------------------
---- PROGRAMS ----
------------------

local menu         = "rofi -show drun"
local terminal     = "kitty"
local fileManager  = "dolphin"
local taskManager  = terminal .. " sh -c btop"
local locker       = "hyprlock"
local screeshotter = "flameshot gui"
local clipboard    = "cursor-clip-toggle"
local browser      = "flatpak run one.ablaze.floorp"
local calculator   = "qalculate-qt"
local notes        = "obsidian"

---------------------
---- KEYBINDINGS ----
---------------------

-- Program Shortcuts
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + C", hl.dsp.exec_cmd(calculator))
hl.bind("SUPER + N", hl.dsp.exec_cmd(notes))

-- Component Shortcuts
hl.bind("SUPER + RETURN",         hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal, {float = true}))
hl.bind("SUPER + E",              hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + SHIFT + E",      hl.dsp.exec_cmd(fileManager, {float = true}))
hl.bind("SUPER + A",              hl.dsp.exec_cmd(menu))
hl.bind("SUPER + ESCAPE",         hl.dsp.exec_cmd(taskManager))
hl.bind("SUPER + ALT + L",        hl.dsp.exec_cmd(locker))
hl.bind("PRINT",                  hl.dsp.exec_cmd(screeshotter))
hl.bind("SUPER + V",              hl.dsp.exec_cmd(clipboard))

-- Window Manipulation
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("CONTROL + ALT + DELETE", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("hyprctl kill"))

-- Window Traversal & Transposition (Vim binds)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))

-- Workspace Traversal & Transposition (with SUPER (+ SHIFT) + [0-9])
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Named workspaces for persistent apps (with windowrules) above the right hand homerow
hl.bind("SUPER + Y", hl.dsp.focus({ workspace = "S" })) -- Spotify/Music
hl.bind("SUPER + U", hl.dsp.focus({ workspace = "D-P" })) -- Discord Popout
hl.bind("SUPER + I", hl.dsp.focus({ workspace = "D" })) -- Discord
hl.bind("SUPER + O", hl.dsp.focus({ workspace = "F" })) -- Fluxer
hl.bind("SUPER + P", hl.dsp.focus({ workspace = "T" })) -- Telegram
hl.bind("SUPER + SHIFT + Y", hl.dsp.window.move({ workspace = "S" }))
hl.bind("SUPER + SHIFT + U", hl.dsp.window.move({ workspace = "D-P" }))
hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "D" }))
hl.bind("SUPER + SHIFT + O", hl.dsp.window.move({ workspace = "F" }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "T" }))

-- Move workspaces across monitors
hl.bind("SUPER + ALT + 1", hl.dsp.workspace.move({ monitor = "HDMI-A-1" }))
hl.bind("SUPER + ALT + 2", hl.dsp.workspace.move({ monitor = "DP-1" }))

-- Scroll through existing workspaces
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                 { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                 { locked = true, repeating = true })

-- Player Binds
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
