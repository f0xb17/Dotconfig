-- Wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- Getting the Configuration API
local config = {}

-- Theme Configuration
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- Font Configuration
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13
config.line_height = 1.5

-- Window Configuration
config.enable_tab_bar = false
-- config.initial_cols = 150
-- config.initial_rows = 50
config.window_background_opacity = 0.9
config.window_decorations = "NONE"

-- Start window maximized
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
