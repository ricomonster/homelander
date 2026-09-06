-- VARIABLES
local vars = require("variables")
local monitors = vars.monitors

--------------------------------
---- WORKSPACES ----
--------------------------------
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({
	workspace = "1",
	monitor = monitors.secondary,
	persistent = true,
	default = true,
})
hl.workspace_rule({
	workspace = "2",
	monitor = monitors.secondary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "3",
	monitor = monitors.primary,
	persistent = true,
	default = true,
})
hl.workspace_rule({
	workspace = "4",
	monitor = monitors.primary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "5",
	monitor = monitors.secondary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "6",
	monitor = monitors.secondary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "7",
	monitor = monitors.primary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "8",
	monitor = monitors.primary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "9",
	monitor = monitors.secondary,
	persistent = true,
})
hl.workspace_rule({
	workspace = "10",
	monitor = monitors.primary,
	persistent = true,
})
