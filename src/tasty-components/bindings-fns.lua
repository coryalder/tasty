
-- noctalia ipc
Tasty.ipc = "noctalia msg "

Tasty.isTerminalFocused = function()
    local win = hl.get_active_window()
    return win ~= nil and (win.class == "Alacritty" or win.title:find(Tasty.terminal, 1, true) == 1)
end

Tasty.send_shortcut_once = function (mods, key, showNote)
    return function()
        hl.dispatch(hl.dsp.send_key_state({mods = mods, key = key, state = "down"}))
        hl.timer(function()
	    hl.dispatch(hl.dsp.send_key_state({mods = mods, key = key, state = "up"}))
        end, { timeout = 50, type = "oneshot" })
	if showNote then
            hl.dispatch(hl.dsp.exec_cmd(Tasty.ipc .. "notification-show '{\"app_name\": \"clipboard\", \"summary\":\"" .. mods .. "+" .. key .. "\", \"timeout_ms\": 500, \"icon\": \"circle-check\"}'"))
        end
    end
end
