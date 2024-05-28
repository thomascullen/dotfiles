-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'rose-pine'

config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Medium' })
config.font_size = 13.0
config.line_height = 1.5

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- config.window_decorations = 'RESIZE'

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
