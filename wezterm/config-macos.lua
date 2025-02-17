-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Storm"

config.window_background_opacity = 0.9

config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "Regular", style = "Normal" },
	"Noto Color Emoji",
	"Symbols Nerd Font Mono",
})
config.font_size = 14
config.keys = {
	{
		key = "Enter",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
}

return config
