return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
      require("config.colorscheme")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'deep',
        transparent = true,
        term_colors = true,
        lualine = {
          transparent = false,
        },
        code_style = {
          comments = 'italic',
          keywords = 'italic',
        }
      }
      onedark.load()
    end
  },
  { "nvim-lua/plenary.nvim" },
  -- UI --
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
      require("plugins.treesitter")
    end,
    dependencies = {
      "mrjones2014/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },
  -- Navigating (Telescope/Tree/Refactor)
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "refactor",
      },
      {
        "<Leader>pr",
        "<cmd>lua require('spectre').open_visual()<CR>",
        mode = "v",
        desc = "refactor",
      }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("plugins.telescope")
    end,
    dependencies = {
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "cljoly/telescope-repo.nvim" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
      "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
      "NvimTreeFocus",
    },
    config = function()
      require("plugins.nvimtree")
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true, -- run require("stay-in-place").setup()
  },
  -- LSP Base
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    servers = nil,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  -- LSP Cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
      {
        "David-Kunz/cmp-npm",
        config = function()
          require('cmp-npm').setup({
            ignore = {},
            only_semantic_versions = true,
          })
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function ()
          require("copilot_cmp").setup()
        -- config = function()
        --   require("copilot_cmp").setup({
        --     formatters = {
        --       insert_text = require('copilot_cmp.format').remove_existing
        --     }
        --   })
        end,
      },
    },
  },

  -- Formatters
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   event = "BufNewFile",
  --   dependencies = { "mason.nvim" },
  -- },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "jose-elias-alvarez/null-ls.nvim",
  --   },
  --   config = function()
  --     require("plugins.null-ls")
  --   end,
  -- },

  -- LSP addons
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("plugins.dressing")
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("plugins.trouble")
    end,
  },
  { "nvim-lua/popup.nvim" },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("plugins.navic")
    end,
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.typescript-tools")
    end,
  },
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = true, -- run require("template-string").setup()
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = { "TSC" },
    config = true,
  },
  {
    "dnlhc/glance.nvim",
    config = true,
    opts = {
      hooks = {
        before_open = function(results, open, jump, method)
          if #results == 1 then
            jump(results[1]) -- argument is optional
          else
            open(results)    -- argument is optional
          end
        end,
      },
    },
    cmd = { "Glance" },
    keys = {
      { "gd", "<cmd>Glance definitions<CR>",      desc = "LSP Definition" },
      { "gr", "<cmd>Glance references<CR>",       desc = "LSP References" },
      { "gm", "<cmd>Glance implementations<CR>",  desc = "LSP Implementations" },
      { "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "LspAttach",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    },
    config = function()
      require("lsp-file-operations").setup()
    end
  },
  { "tpope/vim-repeat",       lazy = false },
  {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = { ".git", "package.json", "yarn.lock", ".eslintrc.js", "jest.config.js" }
    end,
  },
  { "kylechui/nvim-surround", lazy = false, config = true },
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  {
    'lvimuser/lsp-inlayhints.nvim',
    branch = "main", -- or "anticonceal"
    config = function()
      require("plugins.inlay-hints")
    end,
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.git.signs")
    end,
    keys = {
      { "<Leader>ghd", desc = "diff hunk" },
      { "<Leader>ghp", desc = "preview" },
      { "<Leader>ghR", desc = "reset buffer" },
      { "<Leader>ghr", desc = "reset hunk" },
      { "<Leader>ghs", desc = "stage hunk" },
      { "<Leader>ghS", desc = "stage buffer" },
      { "<Leader>ght", desc = "toggle deleted" },
      { "<Leader>ghu", desc = "undo stage" },
    }
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    config = function()
      require("plugins.git.diffview")
    end,
    keys = {
      { "<Leader>gd", "<cmd>lua require('plugins.git.diffview').toggle_file_history()<CR>", desc = "diff file" },
      { "<Leader>gs", "<cmd>lua require('plugins.git.diffview').toggle_status()<CR>",       desc = "status" }
    },
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    config = function()
      require("plugins.git.conflict")
    end,
    keys = {
      { "<Leader>gcb", '<cmd>GitConflictChooseBoth<CR>',   desc = 'choose both' },
      { "<Leader>gcn", '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
      { "<Leader>gco", '<cmd>GitConflictChooseOurs<CR>',   desc = 'choose ours' },
      { "<Leader>gcp", '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
      { "<Leader>gct", '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose theirs' },
    }
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    lazy = false,
    config = function()
      require("plugins.git.worktree")
    end,
    keys = {
      { "<Leader>gww", desc = "worktrees" },
      { "<Leader>gwc", desc = "create worktree" }
    }
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitFilterCurrentFile",
      "LazyGitFilter",
    },
    keys = {
      { "<Leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end,
  },
  -- Copilot
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'onsails/lspkind-nvim',
    config = function()
      require('plugins.lspkind')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function()
      require('plugins.lualine')
    end,
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("plugins.colorizer")
    end,
  },
  {
    'akinsho/nvim-bufferline.lua',
    lazy = false,
    config = function()
      require('plugins.bufferline')
    end,
  },
  {
    'famiu/bufdelete.nvim',
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>x', function() require('bufdelete').bufdelete(0, false) end, { desc = "close buffer" })
    end,
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    branch = "jsx",
    config = function()
      require("plugins.comment")
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- Comment JSX properly
  {
    'lukas-reineke/indent-blankline.nvim',           -- indent blankline correctly
    lazy = true,
    config = function()
      require("plugins.blankline")
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end,
  },

  -- Integrated Terminal --
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    branch = "main",
    config = function()
      require("plugins.toggleterm")
    end,
  },

  -- use ({
  --   'glepnir/lspsaga.nvim',
  --   requires = { { 'nvim-tree/nvim-web-devicons'} }
  -- })

  -- IDE Tools --
  {
    'David-Kunz/jester',
    lazy = false,
    config = function()
      require("plugins.jester")
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    -- cond = EcoVim.plugins.jump_by_subwords.enabled,
    lazy = true,
    keys = { "w", "e", "b", "ge" },
    config = function()
      vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set(
        { "n", "o", "x" },
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        { desc = "Spider-ge" }
      )
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require("plugins.autopairs")
    end,
  },

  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    lazy = true,
    config = function()
      require('plugins.which-key')
    end,
  },

  {
    'nvim-neotest/neotest',
    enabled = false,
    lazy = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'antoinemadec/FixCursorHold.nvim' },
      { 'haydenmeade/neotest-jest' }
    },
    config = function()
      require("plugins.neotest")
    end,
  },

  {
    "andythigpen/nvim-coverage",
    enabled = false,
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "Coverage",
      "CoverageSummary",
      "CoverageLoad",
      "CoverageShow",
      "CoverageHide",
      "CoverageToggle",
      "CoverageClear",
    },
    config = function()
      require("coverage").setup()
    end,
  },
  {
    "ecosse3/galaxyline.nvim",
    config = function()
      require("plugins.galaxyline")
    end,
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
    init = function()
      local banned_messages = {
        "No information available",
        "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
        "LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_messages) do
          if msg == banned then
            return
          end
        end
        return require("notify")(msg, ...)
      end
    end,
  },
}
