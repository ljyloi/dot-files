
local wezterm = require("wezterm")

local M = {}

function M.apply_to_config(config)

	-- set opacity to make the term transparent
	config.window_background_opacity = 0.9
	-- this will make vim transparent
	config.text_background_opacity = 0.7

end

return M
