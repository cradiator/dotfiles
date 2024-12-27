-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 16
-- and finally, return the configuration to wezterm
return config
