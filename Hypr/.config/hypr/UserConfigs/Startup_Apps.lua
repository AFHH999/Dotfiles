-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- Commands and Apps to be executed at launch
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"
local wallDIR = os.getenv("HOME") .. "/Pictures/wallpapers"

hl.on("hyprland.start", function()
	hl.exec_cmd("swww-daemon --format xrgb && sleep 1 && swww img " .. wallDIR .. "/mecha-nostalgia.png")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd(scriptsDir .. "/Polkit.sh")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("swaync")
	hl.exec_cmd("ags")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("rog-control-center")
	hl.exec_cmd("waybar")
	hl.exec_cmd("qs")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("sleep 2 && hyprctl dispatch dpms on")
	hl.exec_cmd("pgrep -x hypridle || hypridle")
end)

-- Start hypridle outside startup handler so it also runs on hyprctl reload
hl.exec_cmd("hypridle")
