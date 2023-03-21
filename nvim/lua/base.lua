local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

-- disable netrw at the very start of your init.lua (strongly advised) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.o.background = "dark"

autocmd("VimResized", {
  group = wr_group,
  pattern = "*",
  command = "wincmd =",
  desc = "Automatically resize window when the host window size changes."
})

opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.background = 'dark'

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = ","

local default_providers = {
  "node",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
