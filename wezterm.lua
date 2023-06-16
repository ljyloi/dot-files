-- I'm wezterm.lua and I should live in ~/.config/wezterm/wezterm.lua

local wezterm = require("wezterm")
-- local key_bindings = require("key_bindings")
-- local appearance = require("appearance")
local config = {}


local function apply_key_bindings_to_config(config) 
	-- trigger launcher menu
	config.keys = {
		{
			 key = "a", mods = "ALT", action = wezterm.action.ShowLauncher,
		},
	}
	-- table.insert(config.keys, {
	-- })
end

local function apply_appearance_to_config(config)
	-- set opacity to make the term transparent
	config.window_background_opacity = 0.9
	-- this will make vim transparent
	config.text_background_opacity = 0.7
end

local function apply_launch_and_program_to_config(config)
	-- Spawn a fish shell in login mode

	config.default_prog = { '/opt/homebrew/bin/fish', '-l' }
	-- config.default_cwd = "~"

	-- launch_menu configuration
	launch_menu = {}
	-- windows configuration
	if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	  table.insert(launch_menu, {
		label = 'PowerShell',
		args = { 'powershell.exe', '-NoLogo' },
	  })

	  -- Find installed visual studio version(s) and add their compilation
	  -- environment command prompts to the menu
	  for _, vsvers in
		ipairs(
		  wezterm.glob('Microsoft Visual Studio/20*', 'C:/Program Files (x86)')
		)
	  do
		local year = vsvers:gsub('Microsoft Visual Studio/', '')
		table.insert(launch_menu, {
		  label = 'x64 Native Tools VS ' .. year,
		  args = {
			'cmd.exe',
			'/k',
			'C:/Program Files (x86)/'
			  .. vsvers
			  .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
		  },
		})
	  end
	end

	config.launch_menu = launch_menu

end

-------------------------------------------------------

-- key_bindings configuration
apply_key_bindings_to_config(config)
-- appearance configuration
apply_appearance_to_config(config)

-- launch_menu and spawn program
apply_launch_and_program_to_config(config)


return config


