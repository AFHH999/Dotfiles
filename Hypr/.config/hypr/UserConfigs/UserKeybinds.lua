-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- This is where you put your own keybinds. Be Mindful to check as well ~/.config/hypr/configs/Keybinds.lua to avoid conflict
-- if you think I should replace the Pre-defined Keybinds in ~/.config/hypr/configs/Keybinds.lua , submit an issue or let me know in DC and present me a valid reason as to why, such as conflicting with global shortcuts, etc etc

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more settings and variables
-- See also Laptops.lua for laptops keybinds
dofile(os.getenv("HOME") .. "/.config/hypr/UserConfigs/01-UserDefaults.lua")

-- /* ---- ✴️ Variables ✴️ ---- */  --
local mainMod = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"
local UserScripts = os.getenv("HOME") .. "/.config/hypr/UserScripts"
local UserConfigs = os.getenv("HOME") .. "/.config/hypr/UserConfigs"

-- common shortcuts
--hl.bind(mainMod .. "+D", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"))
hl.bind(mainMod .. "+D", hl.dsp.exec_cmd("pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window")) -- Main Menu (APP Launcher)
hl.bind(mainMod .. "+B", hl.dsp.exec_cmd(browser)) -- default browser
hl.bind(mainMod .. "+A", hl.dsp.exec_cmd("pkill rofi || true && ags -t 'overview'")) -- desktop overview (if installed)
hl.bind(mainMod .. "+Return", hl.dsp.exec_cmd(term)) --terminal
hl.bind(mainMod .. "+E", hl.dsp.exec_cmd(files)) --file manager

-- FEATURES / EXTRAS
hl.bind(mainMod .. "+H", hl.dsp.exec_cmd(scriptsDir .. "/KeyHints.sh")) -- help / cheat sheet
hl.bind(mainMod .. "+ALT+R", hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh")) -- Refresh waybar, swaync, rofi
hl.bind(mainMod .. "+ALT+E", hl.dsp.exec_cmd(scriptsDir .. "/RofiEmoji.sh")) -- emoji menu
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(scriptsDir .. "/RofiSearch.sh")) -- Google search using rofi
hl.bind(mainMod .. "+ALT+O", hl.dsp.window.tag({ tag = "no_blur" })) -- Toggle blur off for active window only
hl.bind(mainMod .. "+SHIFT+G", hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh")) -- Toggle animations ON/OFF
hl.bind(mainMod .. "+ALT+L", hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh")) -- Toggle Master or Dwindle Layout
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh")) -- Clipboard Manager
hl.bind(mainMod .. "+CTRL+R", hl.dsp.exec_cmd(scriptsDir .. "/RofiThemeSelector.sh")) -- KooL Rofi Menu Theme Selector
hl.bind(
	mainMod .. "+CTRL+SHIFT+R",
	hl.dsp.exec_cmd("pkill rofi || true && " .. scriptsDir .. "/RofiThemeSelector-modified.sh")
) -- modified Rofi Theme Selector

hl.bind(mainMod .. "+SHIFT+F", hl.dsp.window.fullscreen()) -- whole full screen
hl.bind(mainMod .. "+CTRL+F", hl.dsp.window.fullscreen({ mode = "maximized" })) -- fake full screen
hl.bind(mainMod .. "+SPACE", hl.dsp.window.float()) --Float Mode
hl.bind(mainMod .. "+ALT+SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat")) --All Float Mode
hl.bind(mainMod .. "+SHIFT+Return", hl.dsp.exec_cmd(scriptsDir .. "/Dropterminal.sh " .. term)) -- Dropdown terminal

-- Desktop zooming or magnifier
hl.bind(
	mainMod .. "+ALT+mouse_down",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')"]]
	)
)
hl.bind(
	mainMod .. "+ALT+mouse_up",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')"]]
	)
)

-- ## NOTES for ja (Hyprland version 0.39 (Ubuntu 24.04))
--hl.bind(mainMod .. "+ALT+mouse_down", "exec", [[hyprctl keyword misc:cursor_zoom_factor ...]])
--hl.bind(mainMod .. "+ALT+mouse_up", "exec", [[hyprctl keyword misc:cursor_zoom_factor ...]])

-- Waybar / Bar related
hl.bind(mainMod .. "+CTRL+ALT+B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar")) -- Toggle hide/show waybar
hl.bind(mainMod .. "+CTRL+B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh")) -- Waybar Styles Menu
hl.bind(mainMod .. "+ALT+B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh")) -- Waybar Layout Menu

-- FEATURES / EXTRAS (UserScripts)
hl.bind(mainMod .. "+SHIFT+M", hl.dsp.exec_cmd(UserScripts .. "/RofiBeats.sh")) -- online music using rofi
hl.bind(mainMod .. "+W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh")) -- Select wallpaper to apply
hl.bind(mainMod .. "+SHIFT+W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh")) -- Wallpaper Effects by imagemagick
hl.bind("CTRL+ALT+W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh")) -- Random wallpapers
hl.bind(mainMod .. "+SHIFT+K", hl.dsp.exec_cmd(scriptsDir .. "/KeyBinds.sh")) -- search keybinds via rofi
hl.bind(mainMod .. "+SHIFT+A", hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh")) --hyprland animations menu
hl.bind(mainMod .. "+SHIFT+O", hl.dsp.exec_cmd(UserScripts .. "/ZshChangeTheme.sh")) -- Change oh-my-zsh theme

hl.bind(
	"SHIFT+ALT_L",
	hl.dsp.exec_cmd(scriptsDir .. "/SwitchKeyboardLayout.sh"),
	{ locked = true, non_consuming = true }
)

hl.bind(
	"ALT+SHIFT+ALT_L",
	hl.dsp.exec_cmd(scriptsDir .. "/Tak0-Per-Window-Switch.sh"),
	{ locked = true, non_consuming = true }
)

hl.bind(mainMod .. "+L", hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind(mainMod .. "+C", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind(mainMod .. "+T", hl.dsp.exec_cmd("ghostty"))
hl.bind("CTRL+ALT+Return", hl.dsp.exec_cmd(UserScripts .. '/NDropDownTerm.sh "ghostty --title=dropdown-terminal"'))

-- For passthrough keyboard into a VM (still commented out, no fix needed unless you enable these)
-- hl.bind(mainMod .. "+ALT+P", "submap", "passthru")
-- hl.submap("passthru")
-- to unbind
--hl.bind(mainMod .. "+ALT+P", "submap", "reset")
-- hl.submap("reset")

hl.bind(mainMod .. "+SHIFT+1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. "+SHIFT+2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. "+SHIFT+3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. "+SHIFT+4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. "+SHIFT+5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. "+SHIFT+6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. "+SHIFT+7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. "+SHIFT+8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. "+SHIFT+9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. "+SHIFT+0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. "+CTRL+O", hl.dsp.window.tag({ tag = "opaque" })) -- no +/- prefix = toggle
