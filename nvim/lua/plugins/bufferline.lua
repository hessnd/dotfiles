local status, bufferline = pcall(require, "bufferline")
if (not status) then return end
local map = require("utils").map

bufferline.setup({
  options = {
    mode = "buffers",
    color_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    close_command = "<leader>x"
  },
  highlights = {
    buffer_selected = {
      bold = false,
      italic = false,
    }
  }
})

map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
