local wezterm = require("wezterm")
local config = wezterm.config_builder()


config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.colors = {
  tab_bar = {
    background = "#100F0F",
    active_tab = {
      bg_color = "#575653",
      fg_color = "#FFFCF0",
    },
    inactive_tab = {
      bg_color = "#100F0F",
      fg_color = "#CECDC3",
    },
    inactive_tab_hover = {
      bg_color = "#100f0f",
      fg_color = "#cecdc3",
    },
    new_tab = {
      bg_color = "#100F0F",
      fg_color = "#CECDC3",
    },
    new_tab_hover = {
      bg_color = "#100F0F",
      fg_color = "#CECDC3",
    },
  }
}
config.color_scheme = "Flexoki Dark"
config.color_schemes = {
  ["Flexoki Dark"] = {
    ansi = {
      "#100F0F",
      "#AF3029",
      "#66800B",
      "#AD8301",
      "#205EA6",
      "#5E409D",
      "#24837B",
      "#CECDC3",
    },
    brights = {
      "#575653",
      "#D14D41",
      "#879A39",
      "#D0A215",
      "#4385BE",
      "#8B7EC8",
      "#3AA99F",
      "#FFFCF0",
    },
    foreground = "#CECDC3",
    background = "#100F0F",

    cursor_bg = "#CECDC3",
    cursor_border = "#CECDC3",
    cursor_fg = "#100F0F",
    selection_bg = "#282726",
    selection_fg = "#CECDC3",
  },
}
config.exit_behavior = "CloseOnCleanExit"
-- config.exit_behavior_messaging = "None"
config.font = wezterm.font("D2CodingLigature Nerd Font")
config.font_size = 16
config.initial_cols = 140
config.initial_rows = 30
config.line_height = 1.2
config.max_fps = 120
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.tab_max_width = 32
-- config.window_frame = {}
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.5cell",
  bottom = "0.5cell",
}
config.window_background_opacity = 1.0
-- config.window_background_image = '/path/to/wallpaper.jpg'
-- config.window_background_image_hsb = {
--   brightness = 0.3,
--   hue = 1.0,
--   saturation = 1.0,
-- }
-- config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
-- config.keys = {
--   {
--     key = "c",
--     mods = "LEADER",
--     action = wezterm.action({ SpawnTab = "CurrentPaneDomain" })
--   },
--   {
--     key = "x",
--     mods = "LEADER",
--     action = wezterm.action({ CloseCurrentPane = { confirm = true } })
--   },
--   {
--     key = "X",
--     mods = "LEADER",
--     action = wezterm.action({ CloseCurrentTab = { confirm = true } })
--   },
--   {
--     key = "h",
--     mods = "LEADER",
--     action = wezterm.action { ActivatePaneDirection = "Left" }
--   },
--   {
--     key = "l",
--     mods = "LEADER",
--     action = wezterm.action { ActivatePaneDirection = "Right" }
--   },
--   {
--     key = "k",
--     mods = "LEADER",
--     action = wezterm.action { ActivatePaneDirection = "Up" }
--   },
--   {
--     key = "j",
--     mods = "LEADER",
--     action = wezterm.action { ActivatePaneDirection = "Down" }
--   },
--   -- {
--   --   key = "LeftArrow",
--   --   mods = "LEADER",
--   --   action = wezterm.action { AdjustPaneSize = "Left" }
--   -- },
--   -- {
--   --   key = "RightArrow",
--   --   mods = "LEADER",
--   --   action = wezterm.action { AdjustPaneSize = "Right" }
--   -- },
--   -- {
--   --   key = "UpArrow",
--   --   mods = "LEADER",
--   --   action = wezterm.action { AdjustPaneSize = "Up" }
--   -- },
--   -- {
--   --   key = "DownArrow",
--   --   mods = "LEADER",
--   --   action = wezterm.action { AdjustPaneSize = "Down" }
--   -- },
--   {
--     key = "n",
--     mods = "LEADER",
--     action = wezterm.action({ ActivateTabRelative = 1 })
--   },
--   {
--     key = "p",
--     mods = "LEADER",
--     action = wezterm.action({ ActivateTabRelative = -1 })
--   },
--   {
--     key = "v",
--     mods = "LEADER",
--     action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } })
--   },
--   {
--     key = "s",
--     mods = "LEADER",
--     action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } })
--   },
--   {
--     key = "r",
--     mods = "LEADER",
--     action = wezterm.action.ReloadConfiguration
--   },
--   {
--     key = "[",
--     mods = "LEADER",
--     action = wezterm.action.ActivateCopyMode
--   },
--   {
--     key = "/",
--     mods = "LEADER",
--     action = wezterm.action.ShowLauncher
--   },
-- }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
--   config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
-- end

return config
