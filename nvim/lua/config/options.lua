-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local globals = {
  mapleader = ",",
  maplocalleader = ";",
}
vim.g.root_spec = { "cwd" }
vim.filetype.plugin = true

for k, v in pairs(globals) do
  vim.g[k] = v
end

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

vim.g.lazyvim_cmp = "nvim-cmp"
