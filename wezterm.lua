-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'terafox'

config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'Medium' })
config.font_size = 13.0
config.line_height = 1.5

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.98
config.macos_window_background_blur = 80

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
