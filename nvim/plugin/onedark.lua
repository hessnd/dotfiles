local status, onedark = pcall(require, "onedark")
if (not status) then return end

onedark.setup {
  style = 'deep',
  transparent = true,
  term_colors = true,
  lualine = {
    transparent = false,
  },
  code_style = {
    comments = 'italic',
    keywords = 'italic',
  }
}

-- https://github.com/alacritty/alacritty/issues/489#issuecomment-288074579
-- to go in tmux.conf
-- # enable true color support and italics
-- set -g default-terminal "xterm-256color-italic"
-- set -ga terminal-overrides ",xterm-256color-italic:Tc"

onedark.load()
