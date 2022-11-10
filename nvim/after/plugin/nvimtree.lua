local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    }
  },
  filesystem_watchers = {
    enable = true,
  },
})
