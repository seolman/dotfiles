local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
local colors, _ = wezterm.color.load_scheme(wezterm.config_dir .. "/themes/Flexoki Dark.toml")
config.colors = colors
config.font = wezterm.font("D2CodingLigature Nerd Font")
config.font_size = 16
config.initial_cols = 140
config.initial_rows = 30
config.line_height = 1.4
config.max_fps = 120
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.5cell",
  bottom = "0.5cell",
}
config.window_background_opacity = 0.8
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_close_confirmation = "NeverPrompt"
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "powershell" }
end

return config
