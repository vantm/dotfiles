local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "GruvboxDarkHard"

config.font = wezterm.font("FantasqueSansM Nerd Font")
config.font_size = 11

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 40

config.launch_menu = config.launch_menu or {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	local pwsh = { os.getenv("USERPROFILE") .. "\\scoop\\apps\\pwsh\\current\\pwsh.exe", "-NoLogo" }

	table.insert(config.launch_menu, {
		label = "PowerShell Core",
		args = pwsh,
	})

	table.insert(config.launch_menu, {
		label = "PowerShellCore",
		args = { "powershell.exe", "-NoLogo" },
	})

	config.default_prog = pwsh
end

return config
