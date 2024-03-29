local opt = vim.opt
local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

-- disable netrw at the very start of your init.lua (strongly advised) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

autocmd("VimResized", {
  group = wr_group,
  pattern = "*",
  command = "wincmd =",
  desc = "Automatically resize window when the host window size changes."
})

opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.background = 'dark'
opt.cmdheight = 0
opt.completeopt = "menu,menuone,noselect" --- Better autocompletion

opt.foldcolumn = "0"
opt.foldnestmax = 0
opt.foldlevel = 99      --- Using ufo provider need a large value
opt.foldlevelstart = 99 --- Expand all folds by default
opt.title = true
opt.clipboard = "unnamed,unnamedplus"
opt.cursorline = true
opt.emoji = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.showtabline = 2
opt.smarttab = true

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
opt.signcolumn = "yes:2"

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

-- Startup Timeout
opt.timeoutlen = 200
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = ","

-- TS context commentstring
g.skip_ts_context_commentstring_module = true

local default_providers = {
  "node",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
