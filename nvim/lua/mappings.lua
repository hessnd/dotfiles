local map = require("utils").map

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
map("n", "<leader>b", "<cmd> enew <CR>", { desc = "new buffer" })

-- NvimTree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")
map("n", "<leader>tt", "<cmd> NvimTreeFindFile <CR>")

-- Comment
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- Glance
map("n", "gd", "<cmd>Glance definitions<CR>", { desc = "LSP Definition" })
map("n", "gr", "<cmd>Glance references<CR>", { desc = "LSP References" })
map("n", "gm", "<cmd>Glance implementations<CR>", { desc = "LSP Implementations" })
map("n", "gy", "<cmd>Glance type_definitions<CR>", { desc = "LSP Type Definitions" })


-- telescope
map(
  "n",
  "<leader>tk",
  "<cmd>Telescope keymaps <CR>",
  { desc = "show keys" }
)
-- telescope git
map(
  "n",
  "<leader>cm",
  "<cmd>Telescope git_commits <CR>",
  { desc = "git commits" }
)
