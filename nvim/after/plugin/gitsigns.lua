local status, gitsigns = pcall(require, "gitsigns")
if not status then return end
local map = require("utils").map

local options = {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  on_attach = function()
    local gs = package.loaded.gitsigns

    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)
  end
}

gitsigns.setup(options)

