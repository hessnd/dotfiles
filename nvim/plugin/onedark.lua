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
  }
}

onedark.load()
