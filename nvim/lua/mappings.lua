local map = require("utils").map

map("n", "<ESC>", "<cmd> noh <CR>")

-- close buffer
map("n", "<leader>x", "<cmd> bdelete <CR>", { desc = "close current buffer" })

-- copy all
map("n", "<C-c>", "<cmd> %y+ <CR>")

map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- new buffer
map("n", "<leader>b", "<cmd> enew <CR>", { desc = "new buffer" })

-- NvimTree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")

-- Comment
map("n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end)
map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- telescope
map(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<CR>",
  { desc = "find files" }
)
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>",
  { desc = "find all" }
)
map(
  "n",
  "<leader>fw",
  "<cmd>Telescope live_grep <CR>",
  { desc = "live grep" }
)
map(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers <CR>",
  { desc = "find buffers" }
)
map(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags <CR>",
  { desc = "help page" }
)
map(
  "n",
  "<leader>fo",
  "<cmd>Telescope oldfiles <CR>",
  { desc = "find oldfiles" }
)
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
map(
  "n",
  "<leader>gt",
  "<cmd>Telescope git_status <CR>",
  { desc = "git status" }
)
