local status, lualine = pcall(require, "lualine")
if (not status) then return end

local options = {
  theme = 'onedark'
}

lualine.setup(options)
