-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'

config.font = wezterm.font('FiraCode Nerd Font', {weight='Medium'})
config.font_size = 14.0
config.line_height = 1.4

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
