local status, lualine = pcall(require, "lualine")
if (not status) then return end

local options = {
  options = {
    theme = 'onedark',
  },
  sections = {
    lualine_c = {
      {
        'buffers',
        show_filename_only = false,
      }
    }
  }
}

lualine.setup(options)
