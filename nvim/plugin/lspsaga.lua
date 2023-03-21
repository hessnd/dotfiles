local status, saga = pcall(require, "lspsaga")
if (not status) then return end

local map = require("utils").map

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  finder_request_timeout = 5000,
}

local opts = { silent = true }
map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
map('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
map('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
map('n', '<leader>cd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
map({'n', 'v'}, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
-- map('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', opts)

-- Float Terminal
map('n', '<A-d>', '<Cmd>Lspsaga open_floaterm<CR>', opts)
--  Close Float Term
map('t', '<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], opts)

