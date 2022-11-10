local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
local map = require("utils").map

bufferline.setup({
  options = {
    mode = "buffers",
    color_icons = true,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      bg = '#657b83',
      fg = '#002b36'
    },
    buffer_selected = {
      fg = '#002b36',
      bg = '#657b83',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
})

map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
