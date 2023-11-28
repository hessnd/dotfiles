local map = require("utils").map
local keymap = vim.keymap.set
local silent = { silent = true }

-- Clear highlights
map("n", "<ESC>", "<cmd> noh <CR>")

-- copy all
map("n", "<C-c>", "<cmd> %y+ <CR>")

-- Navigate windows
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Splits
map("n", "vv", "<cmd> :vsplit<CR>")
-- map("n", "hh", "<cmd> :split<CR>") -- TODO: find better keymap

-- Open links under cursor with gx
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>")

-- Don't yank on delete char
map("n", "x", '"_x')
map("n", "X", '"_X')
map("v", "x", '"_x')
map("v", "X", '"_X')

-- new buffer
map("n", "<leader>b", "<cmd> new <CR>", { desc = "new buffer" })

-- NvimTree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")

-- Comment
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
-- LSP
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent) -- Replaced with Glance plugin
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent) -- Replaced with Glance plugin
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "K", function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

-- telescope
map(
  "n",
  "<leader>tk",
  "<cmd>Telescope keymaps <CR>",
  { desc = "show keys" }
)
-- telescope git
-- map(
--   "n",
--   "<leader>cm",
--   "<cmd>Telescope git_commits <CR>",
--   { desc = "git commits" }
-- )
