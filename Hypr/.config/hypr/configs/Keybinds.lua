-- Keybinds.lua - Correct syntax for Hyprland 0.56.1
local mainMod = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"

-- System Controls
hl.bind("CTRL+ALT+Delete", hl.dsp.exit())
hl.bind(mainMod .. "+Q", hl.dsp.window.close())
hl.bind(mainMod .. "+SHIFT+Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"))
hl.bind(mainMod .. "+L", hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"))
hl.bind("CTRL+ALT+P", hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"))
hl.bind(mainMod .. "+SHIFT+N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. "+SHIFT+E", hl.dsp.exec_cmd(scriptsDir .. "/Kool_Quick_Settings.sh"))

-- Master Layout
hl.bind(mainMod .. "+CTRL+D", hl.dsp.layout("removemaster"))
hl.bind(mainMod .. "+I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. "+J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. "+K", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. "+CTRL+Return", hl.dsp.layout("swapwithmaster"))

-- Dwindle Layout
hl.bind(mainMod .. "+SHIFT+I", hl.dsp.layout("togglesplit")) -- confirmed pattern from official example config
hl.bind(mainMod .. "+P", hl.dsp.window.pseudo()) -- confirmed from official example config

-- Layout Options
hl.bind(mainMod .. "+M", hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"))

-- Groups
hl.bind(mainMod .. "+G", hl.dsp.group.toggle()) -- confirmed
hl.bind(mainMod .. "+CTRL+tab", hl.dsp.group.next())

-- Cycle Windows
hl.bind("ALT+tab", hl.dsp.window.cycle_next()) -- confirmed
hl.bind("ALT+tab", hl.dsp.window.bring_to_top()) -- confirmed

-- Volume and Audio (locked + repeating = bindel equivalent)
hl.bind("CTRL+ALT+Up", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"), { locked = true, repeating = true })
hl.bind("CTRL+ALT+Down", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"), { locked = true, repeating = true })
hl.bind("CTRL+ALT+A", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { locked = true, repeating = true })
hl.bind("CTRL+ALT+M", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"), { locked = true, repeating = true })
hl.bind("XF86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true, repeating = true })
hl.bind("XF86Rfkill", hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"), { locked = true, repeating = true })

-- Media Controls (locked = bindl equivalent)
hl.bind("CTRL+ALT+Space", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("CTRL+ALT+Right", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"), { locked = true })
hl.bind("CTRL+ALT+Left", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"), { locked = true })

-- Screenshots
hl.bind(mainMod .. "+Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"))
hl.bind(mainMod .. "+SHIFT+Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"))
hl.bind(mainMod .. "+CTRL+Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"))
hl.bind(mainMod .. "+CTRL+SHIFT+Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"))
hl.bind("ALT+Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"))
hl.bind(mainMod .. "+SHIFT+S", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy"))

-- Resize Windows (via helper script — reads current size, applies delta through Lua API)
hl.bind(mainMod .. "+SHIFT+Left",  hl.dsp.exec_cmd(scriptsDir .. "/resize-helper.sh left 50"), { repeating = true })
hl.bind(mainMod .. "+SHIFT+Right", hl.dsp.exec_cmd(scriptsDir .. "/resize-helper.sh right 50"), { repeating = true })
hl.bind(mainMod .. "+SHIFT+Up",    hl.dsp.exec_cmd(scriptsDir .. "/resize-helper.sh up 50"), { repeating = true })
hl.bind(mainMod .. "+SHIFT+Down",  hl.dsp.exec_cmd(scriptsDir .. "/resize-helper.sh down 50"), { repeating = true })

-- Move Windows
hl.bind(mainMod .. "+CTRL+Left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. "+CTRL+Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. "+CTRL+Up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. "+CTRL+Down",  hl.dsp.window.move({ direction = "d" }))

-- Swap Windows
hl.bind(mainMod .. "+ALT+Left",  hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. "+ALT+Right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. "+ALT+Up",    hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. "+ALT+Down",  hl.dsp.window.swap({ direction = "d" }))

-- Move Focus (confirmed — official example config uses this exact pattern)
hl.bind(mainMod .. "+Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+Down", hl.dsp.focus({ direction = "down" }))

-- Workspace Navigation (confirmed via reproduced hyprctl test: hl.dsp.focus({ workspace = n }) moves focus/active workspace)
hl.bind(mainMod .. "+tab", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. "+SHIFT+tab", hl.dsp.focus({ workspace = "m-1" }))

-- Special Workspace
hl.bind(mainMod .. "+SHIFT+U", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))
hl.bind(mainMod .. "+U", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace"))

-- Switch workspaces with mainMod + [1-0] (confirmed pattern)
for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mainMod .. "+" .. key, hl.dsp.focus({ workspace = i }))
end

-- Move window to workspace (already bound in UserKeybinds.lua — kept here as reference)
-- hl.bind(mainMod .. "+SHIFT+1", hl.dsp.window.move({ workspace = 1 }))

-- Silent workspace moves (SUPER+CTRL+number)
for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mainMod .. "+CTRL+" .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Scroll through workspaces
hl.bind(mainMod .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. "+period",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+comma",      hl.dsp.focus({ workspace = "e-1" }))

-- Mouse binds (confirmed — Binds wiki page shows this exact form)
hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Application Launchers
hl.bind("CTRL+A", hl.dsp.exec_cmd("blueman-manager"))
hl.bind("CTRL+M", hl.dsp.exec_cmd("youtube-music"))
hl.bind(mainMod .. "+CTRL+M", hl.dsp.exec_cmd("Telegram"))
