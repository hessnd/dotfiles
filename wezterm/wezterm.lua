local wezterm = require('wezterm')

local config = wezterm.config_builder()
config.term = 'xterm-256color-italic'
config.color_scheme = 'Tokyo Night Storm'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.font = wezterm.font_with_fallback { 'OperatorMono Nerd Font' }
config.font_size = 13.5
config.font_rules = {
  -- For Bold-but-not-italic text, use this relatively bold font, and override
  -- its color to a tomato-red color to make bold text really stand out.
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font_with_fallback(
      { family = 'OperatorMono Nerd Font' },
      -- Override the color specified by the terminal output and force
      -- it to be tomato-red.
      -- The color value you set here can be any CSS color name or
      -- RGB color string.
      { foreground = 'tomato' }
    ),
  },

  -- Bold-and-italic
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font_with_fallback {
      family = 'OperatorMono Nerd Font',
      italic = true,
    },
  },

  -- half-intensity-and-italic (half-bright or dim); use a lighter weight font
  {
    intensity = 'Half',
    italic = true,
    font = wezterm.font_with_fallback {
      family = 'OperatorMono Nerd Font',
      weight = 'Light',
      italic = true,
    },
  },

  -- half-intensity-and-not-italic
  {
    intensity = 'Half',
    italic = false,
    font = wezterm.font_with_fallback {
      family = 'OperatorMono Nerd Font',
      weight = 'Light',
    },
  },
}

wezterm.on('update-right-status', function(window, pane)
  window:set_left_status 'left'
  window:set_right_status 'right'
end)

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

return config
