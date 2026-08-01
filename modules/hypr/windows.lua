-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
hl.window_rule({
	name = "window-rule-steam-games",
	match = {
		class = "^(steam_app_.*)$",
	},
	monitor = "DP-1",
	workspace = "8",
})

hl.window_rule({
	name = "window-rule-steam-app",
	match = {
		class = "^(steam)$",
	},
	monitor = "DP-2",
	workspace = "9",
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "bluetooth-menu",
	match = {
		class = ".*blueman-manager.*",
	},
	opacity = "1.0 override 1.0 override",
	opaque = true,
	float = true,
	size = { 600, 600 },
})

hl.window_rule({
	name = "network-manager",
	match = {
		class = "com.network.manager",
	},
	opacity = "1.0 override 1.0 override",
	opaque = true,
	float = true,
	size = { 600, 600 },
})

hl.window_rule({
	name = "volume-control",
	match = {
		class = "org.pulseaudio.pavucontrol",
	},
	opacity = "1.0 override 1.0 override",
	opaque = true,
	float = true,
	size = { 600, 600 },
})

hl.window_rule({
	name = "pip",
	match = {
		title = "Picture-in-Picture",
	},
	opacity = "1.0 override 1.0 override",
	opaque = true,
	float = true,
})
