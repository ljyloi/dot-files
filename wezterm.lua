-- I'm wezterm.lua and I should live in ~/.config/wezterm/wezterm.lua

local key_bindings = require("key_bindings")
local appearance = require("appearance")
local config = {}

key_bindings.apply_to_config(config)
appearance.apply_to_config(config)

return config

