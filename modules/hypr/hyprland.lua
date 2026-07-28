-- VARIABLES
require("variables")

-- MONITORS
require("monitors")

-- WORKSPACES
require("workspaces")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("sleep 0.5 && waybar & ")
	hl.exec_cmd("hyprpaper & swayosd-server & /usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd(Spotify, { workspace = "2" })
	hl.exec_cmd(PrimaryBrowser, { workspace = "1" })
	hl.exec_cmd(Steam, { workspace = "9" })
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("mako")
	hl.dsp.focus({ workspace = "1" })
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_CURSOR_SIZE", "24")
hl.env("WLR_DRM_NO_ATOMIC", "1")
hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "1")
hl.env("GDK_SCALE", "1")

hl.env("__GL_GSYNC_ALLOWED", "0")
hl.env("__GL_VRR_ALLOWED", "0")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(7aa2f7ee)", "rgba(7dcfffee)" }, angle = 45 },
			inactive_border = "rgba(414868aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 5,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "0xee1a1b26",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
})

-- macOS-like curves
hl.curve("macosSwipe", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })
hl.curve("macosOpen", { type = "bezier", points = { { 0.34, 1.56 }, { 0.64, 1 } } })
hl.curve("macosClose", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })
hl.curve("macosSnap", { type = "spring", mass = 1, stiffness = 200, dampening = 20 })

-- macOS-like animations
hl.animation({ leaf = "global", enabled = true, speed = 6, bezier = "macosSwipe" })

-- Windows open with a subtle pop
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "macosOpen", style = "popin 80%" })

-- Windows close quickly
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "macosClose", style = "popin 80%" })

-- Window movement
hl.animation({ leaf = "windows", enabled = true, speed = 4, spring = "macosSnap" })

-- Fade
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "macosSwipe" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, bezier = "macosClose" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "macosSwipe" })

-- Workspaces slide like macOS spaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "macosSwipe", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4, bezier = "macosSwipe", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4, bezier = "macosSwipe", style = "slide" })

-- Layers
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "macosSwipe" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "macosOpen", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.5, bezier = "macosClose", style = "fade" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
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

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "razer-razer-viper-ultimate",
	sensitivity = -1,
	natural_scroll = true,
})

hl.device({
	name = "razer-razer-viper-ultimate-1",
	sensitivity = -1,
	natural_scroll = true,
})

hl.device({
	name = "razer-razer-viper-ultimate-dongle",
	sensitivity = -1,
	natural_scroll = true,
})

hl.device({
	name = "razer-razer-viper-ultimate-dongle-1",
	sensitivity = -1,
	natural_scroll = true,
})

hl.device({
	name = "compx-pulsar-xlite-wireless",
	sensitivity = -1,
	natural_scroll = true,
})

---------------------
---- KEYBINDINGS ----
---------------------
require("keybinds")

--------------------------------
---- WINDOWS ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
