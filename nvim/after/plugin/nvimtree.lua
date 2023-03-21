local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

local api = require("nvim-tree.api")

-- Recipes: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes
-- Open file upon creation in nvim-tree
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)

nvimtree.setup({
  filters = {
    dotfiles = false,
    custom = { "^.git$" }, -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Tips#hide-git-directory
  },
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    }
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  }
})
