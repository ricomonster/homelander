---------------------
---- KEYBINDINGS ----
---------------------

-- I have weird stuff here
hl.bind("ALT + E", hl.dsp.exec_cmd(FileManager))
hl.bind("ALT + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd(Applauncher))
hl.bind("ALT + F", hl.dsp.window.fullscreen())

-- Window actions (vi-style)
hl.bind("ALT + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("ALT + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("ALT + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("ALT + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Window focus
hl.bind("ALT + H", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + J", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + K", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + L", hl.dsp.focus({ direction = "right" }))

-- Window resize
-- bindd = ALT SHIFT, equal, Resize to the right, resizeactive, 15 0
-- bindd = ALT SHIFT, minus, Resize to the left, resizeactive, -15 0
-- bindd = ALT SHIFT, comma, Resize upwards, resizeactive, 0 -15
-- bindd = ALT SHIFT, period, Resize downwards, resizeactive, 0 15
hl.bind("ALT + SHIFT + EQUAL", hl.dsp.window.resize({ x = 15, y = 0, relative = true }))
hl.bind("ALT + SHIFT + MINUS", hl.dsp.window.resize({ x = -15, y = 0, relative = true }))
hl.bind("ALT + SHIFT + COMMA", hl.dsp.window.resize({ x = 0, y = 15, relative = true }))
hl.bind("ALT + SHIFT + PERIOD", hl.dsp.window.resize({ x = 0, y = -15, relative = true }))

-- Workspace actions
-- Move window to worksace
hl.bind("ALT + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind("ALT + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind("ALT + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind("ALT + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind("ALT + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind("ALT + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind("ALT + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind("ALT + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind("ALT + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))

-- Focus on workspace
hl.bind("ALT + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("ALT + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("ALT + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("ALT + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("ALT + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind("ALT + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind("ALT + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind("ALT + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind("ALT + 9", hl.dsp.focus({ workspace = "9" }))

-- Overrides as I have a macOS fingers
hl.bind("SUPER + A", hl.dsp.send_shortcut({ mods = "CTRL", key = "A" }))
hl.bind("SUPER + B", hl.dsp.send_shortcut({ mods = "CTRL", key = "B" }))
hl.bind("SUPER + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "C" }))
hl.bind("SUPER + D", hl.dsp.send_shortcut({ mods = "CTRL", key = "D" }))
hl.bind("SUPER + H", hl.dsp.send_shortcut({ mods = "CTRL", key = "H" }))
hl.bind("SUPER + J", hl.dsp.send_shortcut({ mods = "CTRL", key = "J" }))
hl.bind("SUPER + K", hl.dsp.send_shortcut({ mods = "CTRL", key = "K" }))
hl.bind("SUPER + L", hl.dsp.send_shortcut({ mods = "CTRL", key = "L" }))
hl.bind("SUPER + R", hl.dsp.send_shortcut({ mods = "CTRL", key = "R" }))

-- For browsers tabs --
hl.bind("CTRL + 1", hl.dsp.send_shortcut({ mods = "ALT", key = "1" }))
hl.bind("CTRL + 2", hl.dsp.send_shortcut({ mods = "ALT", key = "2" }))
hl.bind("CTRL + 3", hl.dsp.send_shortcut({ mods = "ALT", key = "3" }))
hl.bind("CTRL + 4", hl.dsp.send_shortcut({ mods = "ALT", key = "4" }))
hl.bind("CTRL + 5", hl.dsp.send_shortcut({ mods = "ALT", key = "5" }))
hl.bind("CTRL + 6", hl.dsp.send_shortcut({ mods = "ALT", key = "6" }))
hl.bind("CTRL + 7", hl.dsp.send_shortcut({ mods = "ALT", key = "7" }))
hl.bind("CTRL + 8", hl.dsp.send_shortcut({ mods = "ALT", key = "8" }))
hl.bind("CTRL + 9", hl.dsp.send_shortcut({ mods = "ALT", key = "9" }))
hl.bind("CTRL + 0", hl.dsp.send_shortcut({ mods = "ALT", key = "0" }))

-- Media Controls
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(
		"swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\" --output-volume raise"
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(
		"swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\" --output-volume lower"
	),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(
		"swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\" --output-volume mute-toggle"
	),
	{ locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
