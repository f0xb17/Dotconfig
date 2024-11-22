-- Wezterm API
local wezterm = require("wezterm")

-- Getting the Configuration API
local config = wezterm.config_builder()

-- Theme Configuration
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- Font Configuration
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13

-- Window Configuration
config.enable_tab_bar = false
config.initial_cols = 150
config.initial_rows = 50
config.window_background_opacity = 0.9
config.window_decorations = "NONE"

return config
