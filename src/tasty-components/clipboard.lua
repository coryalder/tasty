-- clipboard bindings

local function clipboardSend(key)
    return function ()
        local mods = Tasty.isTerminalFocused() and "CTRL SHIFT" or "CTRL"
        Tasty.send_shortcut_once(mods, key, true)()
    end
end

hl.bind(Tasty.mainMod .. " + C", clipboardSend("C"))

-- paste (send CTRL+V to most apps, CTRL+SHIFT+V to the terminal)
hl.bind(Tasty.mainMod .. " + V", clipboardSend("V"))

-- cut:
hl.bind(Tasty.mainMod .. " + X", Tasty.send_shortcut_once("CTRL", "X"))

-- select all:
hl.bind(Tasty.mainMod .. " + A", Tasty.send_shortcut_once("CTRL", "A"))