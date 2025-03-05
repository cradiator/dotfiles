-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 13

-- if io.open("/opt/homebrew/bin/fish", "r") then
--   config.default_prog = {"/opt/homebrew/bin/fish"}
-- end

-- and finally, return the configuration to wezterm
return config
