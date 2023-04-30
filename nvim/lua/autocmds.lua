-- Attach specific keybindings in which-key for specific filetypes
local present, _ = pcall(require, "which-key")
if not present then return end
local _, pwk = pcall(require, "plugins.which-key")

vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.ts", "*.tsx" },
  callback = function() pwk.attach_typescript(0) end })

vim.api.nvim_create_autocmd("BufEnter",
  { pattern = { "*test.js", "*test.ts", "*test.tsx" }, callback = function() pwk.attach_jest(0) end })
