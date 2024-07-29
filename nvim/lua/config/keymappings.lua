local keymap = vim.keymap.set
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 comptaibility

-- Fix moving forward in jumplist via <C-i>
keymap("n", "<C-I>", "<C-I>", silent)

-- Navigate windows
keymap("i", "<C-h>", "<Left>", silent)
keymap("i", "<C-l>", "<Right>", silent)
keymap("i", "<C-j>", "<Down>", silent)
keymap("i", "<C-k>", "<Up>", silent)

keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-l>", "<C-w>l", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)

-- Splits
keymap("n", "vv", "<cmd> :vsplit<CR>", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenteting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`v", "U", silent)

-- remove Highlights
keymap("n", "<ESC>", ":noh<CR><CR>", silent)

