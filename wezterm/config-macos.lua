local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Strom"
config.colors = {
	tab_bar = {
		active_tab = {
			fg_color = "#1a1b26",
			bg_color = "#7aa2f7",
		},
		inactive_tab = {
			fg_color = "#414868",
			bg_color = "#16161e",
		},
	},
}

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	-- <built-in>, BuiltIn
	-- AKA: "JetBrains Mono ExtraLight"
	{ family = "JetBrains Mono", weight = "Regular", style = "Normal" },

	-- <built-in>, BuiltIn
	"JetBrains Mono",

	-- <built-in>, BuiltIn
	-- Assumed to have Emoji Presentation
	"Noto Color Emoji",

	-- <built-in>, BuiltIn
	"Symbols Nerd Font Mono",
})
config.font_size = 12

config.native_macos_fullscreen_mode = true
config.macos_window_background_blur = 40

config.window_background_opacity = 0.5

config.window_decorations = "RESIZE | INTEGRATED_BUTTONS"
-- window_decorations = "TITLE | RESIZE | INTEGRATED_BUTTONS"

config.window_padding = {
	-- left = 2,
	-- right = 2,
	top = 8,
	bottom = 4,
}

config.automatically_reload_config = true
config.enable_tab_bar = true
config.default_cursor_style = "BlinkingBar"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

wezterm.on("format-tab-title", function(tab, tabs, panes, config)
	local pane = tab.active_pane
	local process_name = pane and pane.foreground_process_name or ""
	if process_name:find("tmux") then
		local success, stdout, stderr = wezterm.run_child_process({ "tmux", "display-message", "-p", "#S" })
		if success and stdout and stdout ~= "" then
			return stdout:gsub("\n", "")
		end
		return tab.active_pane.title
	end
	local cwd = pane and pane.current_working_dir and pane.current_working_dir.file_path or ""
	local dir_name = cwd:match("([^/]+)$") or "Terminal"
	return dir_name
end)

config.enable_tab_bar = true
config.background = {
	-- {
	-- 	source = {
	-- 		File = home_dir .. "/dotfiles/imgs/cozy-cat.jpg",
	-- 	},
	-- 	repeat_x = "Mirror",
	-- 	horizontal_align = "Center",
	-- 	-- vertical_align = "Middle",
	-- 	-- hsb = {
	-- 	-- 	saturation = 0.7,
	-- 	-- 	brightness = 0.1,
	-- 	-- },
	-- 	hsb = dimmer,
	-- 	attachment = { Parallax = 0.1 },
	--
	-- 	-- width = "100%",
	-- 	-- height = "100%",
	-- },
	-- {
	-- 	source = {
	-- 		Color = "#282c35",
	-- 	},
	-- 	hsb = {
	-- 		saturation = 0.1,
	-- 		brightness = 0.5,
	-- 	},
  -- 	height = "100%",
	-- 	width = "100%",
	-- 	opacity = 0.4,
	-- },
}

local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
config.keys = { -- ...
  -- Previous tab: Meta + Shift + H
	 -- {
	 --   key = 'H',
	 --   mods = 'META|SHIFT',
	 --   action = wezterm.action.ActivateTabRelative(-1),
	 -- },
	 -- -- Next tab: Meta + Shift + L
	 -- {
	 --   key = 'L',
	 --   mods = 'META|SHIFT',
	 --   action = wezterm.action.ActivateTabRelative(-1),
	 -- },
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
		end),
	},
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action({ SendString = "\x1b\r" }),
	},
	{
		key = "W",
		mods = "ALT",
		action = resurrect.window_state.save_window_action(),
	},
	{
		key = "T",
		mods = "ALT",
		action = resurrect.tab_state.save_tab_action(),
	},
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
		end),
	},
	{
		key = "r",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
				local type = string.match(id, "^([^/]+)") -- match before '/'
				id = string.match(id, "([^/]+)$") -- match after '/'
				id = string.match(id, "(.+)%..+$") -- remove file extention
				local opts = {
					relative = true,
					restore_text = true,
					on_pane_restore = resurrect.tab_state.default_on_pane_restore,
				}
				if type == "workspace" then
					local state = resurrect.state_manager.load_state(id, "workspace")
					resurrect.workspace_state.restore_workspace(state, opts)
				elseif type == "window" then
					local state = resurrect.state_manager.load_state(id, "window")
					resurrect.window_state.restore_window(pane:window(), state, opts)
				elseif type == "tab" then
					local state = resurrect.state_manager.load_state(id, "tab")
					resurrect.tab_state.restore_tab(pane:tab(), state, opts)
				end
			end)
		end),
	},
}

return config
