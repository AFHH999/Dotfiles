-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- User Settings
-- This is where you put your own settings as this will not be touched during update
-- if the upgrade.sh is used.

-- refer to Hyprland wiki for more info https://wiki.hyprland.org/Configuring/Variables/
-- NOTE: some settings are in ~/.config/hypr/UserConfigs/UserDecorAnimations.conf

hl.config({
	dwindle = {
		preserve_split = true,
		special_scale_factor = 0.8,
	},
	master = {
		new_status = "master",
		new_on_top = true,
		mfact = 0.5,
	},
	general = {
		resize_on_border = true,
		layout = "dwindle",
	},
	input = {
		kb_layout = "es, us",
		numlock_by_default = true,
		left_handed = false,
		follow_mouse = 1,
		float_switch_override_focus = false,
		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			clickfinger_behavior = false,
			middle_button_emulation = false,
			tap_to_click = true,
			drag_lock = false,
		},
		touchdevice = {
			enabled = true,
		},
		tablet = {
			transform = 0,
			left_handed = false,
		},
	},
	gestures = {
		workspace_swipe_distance = 500,
		workspace_swipe_invert = true,
		workspace_swipe_min_speed_to_force = 30,
		workspace_swipe_cancel_ratio = 0.5,
		workspace_swipe_create_new = true,
		workspace_swipe_forever = true,
		workspace_swipe_use_r = true,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 2,
		mouse_move_enables_dpms = true,
		enable_swallow = false,
		swallow_regex = "^(kitty)$",
		focus_on_activate = false,
		initial_workspace_tracking = 0,
		middle_click_paste = false,
		enable_anr_dialog = true, -- ANR = Application Not Responding
		anr_missed_pings = 15, -- default of 1 is too low
	},
	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		pass_mouse_when_bound = false,
	},
	xwayland = {
		enabled = true,
		force_zero_scaling = true, -- confirmed field name, line 1640 of your stub
	},
	render = {
		direct_scanout = 0,
	},
	cursor = {
		sync_gsettings_theme = true,
		no_hardware_cursors = 2, -- change to 1 to disable
		enable_hyprcursor = true,
		warp_on_change_workspace = 2,
		no_warps = true,
	},
})

-- gesture-swipe binds (ref)
-- hl.bind("swipe:r", hl.dsp.focus({ workspace = "r+1" }))
-- hl.bind("swipe:l", hl.dsp.focus({ workspace = "r-1" }))
