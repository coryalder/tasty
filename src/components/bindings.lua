---------------------
---- KEYBINDINGS ----
---------------------


-- Quit commands:
hl.bind(Tasty.mainMod .. " + Q", hl.dsp.window.close()) -- simple quit
hl.bind(Tasty.mainMod .. " + SHIFT + Q", hl.dsp.window.kill()) -- Kill the process owning the window with a SIGKILL
hl.bind(Tasty.mainMod .. " + W", Tasty.send_shortcut_once("CTRL", "W")) -- send a close window command

-- idk why this is here, a hard shutdown?
-- hl.bind(Tasty.mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Apps:
hl.bind(Tasty.mainMod .. "+ SHIFT + F", hl.dsp.exec_cmd(Tasty.fileManager))
hl.bind(Tasty.mainMod .. " + RETURN", hl.dsp.exec_cmd(Tasty.terminal))
hl.bind(Tasty.mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(Tasty.browser))
hl.bind(Tasty.mainMod .. " + SPACE", hl.dsp.exec_cmd(Tasty.ipc .. "panel-toggle launcher"))

-- Window management:
hl.bind(Tasty.mainMod .. " + ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(Tasty.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(Tasty.mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(Tasty.mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(Tasty.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(Tasty.mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(Tasty.mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Resize windows
local resizeUnit = 20
hl.bind(Tasty.mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = resizeUnit, y = 0, relative=true }), { repeating = true })
hl.bind(Tasty.mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -resizeUnit, y = 0, relative=true }), { repeating = true })
hl.bind(Tasty.mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -resizeUnit, relative=true }), { repeating = true })
hl.bind(Tasty.mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = resizeUnit, relative=true }), { repeating = true })


-- Workspace bindings:
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    -- Switch workspaces with Tasty.mainMod + [0-9]
    hl.bind(Tasty.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

    -- Move window to a different workspace and switch to that workspace with Tasty.mainMod + SHIFT + [0-9]
    hl.bind(Tasty.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    -- Move window to a different workspace but keep current workspace with Tasty.mainMod + CTRL + [0-9]
    hl.bind(Tasty.mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Fullscreen - Window takes up the entire working space, keeping the margins.
hl.bind(Tasty.mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
-- Fullscreen - Window takes up the entire screen.
hl.bind(Tasty.mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))


-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd(Tasty.ipc .. "screenshot-fullscreen pick"))
-- Screenshot a region
hl.bind(Tasty.mainMod .. " +  PRINT", hl.dsp.exec_cmd(ipc .. "screenshot-region"))

-- Example special workspace (scratchpad)
hl.bind(Tasty.mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(Tasty.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with Tasty.mainMod + scroll
hl.bind(Tasty.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Tasty.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with Tasty.mainMod + LMB/RMB and dragging
hl.bind(Tasty.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(Tasty.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

