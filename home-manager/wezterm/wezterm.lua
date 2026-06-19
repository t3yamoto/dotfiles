local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.font_size = 14
config.font = wezterm.font 'UDEV Gothic 35NF'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.color_scheme = 'Kanagawa (Gogh)'

config.inactive_pane_hsb = {  
  hue = 1.0,  
  saturation = 0.7,  
  brightness = 0.7,  
}

-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = true
-- falseにするとタブバーの透過が効かなくなる
-- config.use_fancy_tab_bar = false

-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
  colors = { "#1F1F28" },
}

-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false

config.show_close_tab_button_in_tabs = false

config.colors = {
  split = '#839496',
  tab_bar = {
    -- タブ同士の境界線を非表示
    inactive_tab_edge = "none",
    active_tab = {
      bg_color = 'rgba(31, 31, 40, 0)',
      fg_color = '#E6C384',
    },
    inactive_tab = {
      bg_color = 'rgba(31, 31, 40, 0)',
      fg_color = '#727169',
    },
    inactive_tab_hover = {
      bg_color = 'rgba(31, 31, 40, 0)',
      fg_color = '#E6C384',
    },
  },
}


config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'p', mods = 'SUPER|SHIFT', action = act.ActivateCommandPalette, },

  { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },

  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain', },
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1), },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1), },
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0), },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1), },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2), },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3), },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4), },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5), },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6), },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7), },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8), },
  { key = '0', mods = 'LEADER', action = act.ActivateTab(9), },
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        print("rename tab")
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  { key = "=", mods = "SUPER", action = act.IncreaseFontSize },
  { key = "-", mods = "SUPER", action = act.DecreaseFontSize },
  { key = "0", mods = "SUPER", action = act.ResetFontSize },

  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "q", mods = "LEADER", action = act.QuickSelect },

  { key = 's', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
}

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

    { key = "Enter", action = "PopKeyTable" },
  },
}

return config

