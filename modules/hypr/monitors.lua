-- VARIABLES
local vars = require("variables")
local monitors = vars.monitors

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = monitors.secondary,
	-- mode = "1920x1080@71.91",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
	transform = 1,
})

hl.monitor({
	output = monitors.primary,
	-- mode = "2560x1440@143.86",
	mode = "2560x1440@120",
	position = "1080x0",
	-- position = "1920x0",
	scale = 1,
})
