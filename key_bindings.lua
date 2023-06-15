
local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)

	-- config.color_scheme = 'Batman'
	-- trigger launcher menu
	config.keys = {
		{
			 key = "a", mods = "ALT", action = wezterm.action.ShowLauncher,
		},
	}
	-- table.insert(config.keys, {
	-- })
end

return M
