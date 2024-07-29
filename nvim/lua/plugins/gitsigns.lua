local status, gitsigns = pcall(require, "gitsigns")
if not status then return end
local map = require("utils").map

local options = {
  signs = {
    add = { text = "│",},
    change = { text = "│" },
    delete = { text = "" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  on_attach = function()
    local gs = gitsigns

    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)
  end
}

gitsigns.setup(options)

