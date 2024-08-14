return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      require("config.colorscheme")
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  { "nvim-lua/plenary.nvim" },
  -- UI --
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup({ default = true })
      local icon, color = require("nvim-web-devicons").get_icon_color(".env", "env")
      local _icon, cterm_color = require("nvim-web-devicons").get_icon_cterm_color(".env", "env")
      require("nvim-web-devicons").set_icon({
        [".env.local"] = {
          icon = icon,
          color = color,
          cterm_color = cterm_color,
          name = "env",
        },
      })
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
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Refactor",
    keys = {
      { "<leader>re", ":Refactor extract ",              mode = "x",          desc = "Extract function" },
      { "<leader>rf", ":Refactor extract_to_file ",      mode = "x",          desc = "Extract function to file" },
      { "<leader>rv", ":Refactor extract_var ",          mode = "x",          desc = "Extract variable" },
      { "<leader>ri", ":Refactor inline_var",            mode = { "x", "n" }, desc = "Inline variable" },
      { "<leader>rI", ":Refactor inline_func",           mode = "n",          desc = "Inline function" },
      { "<leader>rb", ":Refactor extract_block",         mode = "n",          desc = "Extract block" },
      { "<leader>rf", ":Refactor extract_block_to_file", mode = "n",          desc = "Extract block to file" },
    },
    config = true
  },
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
      { "nvim-telescope/telescope-fzf-native.nvim",  build = "make" },
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
        config = function()
          require("copilot_cmp").setup()
        end,
      },
      { "petertriho/cmp-git" },
      { "js-everts/cmp-tailwind-colors" },
    },
  },

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
    config = function()
      require("plugins.glance")
    end,
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
  -- General
  { "AndrewRadev/switch.vim", lazy = false },
  {
    "Wansmer/treesj",
    lazy = true,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    keys = {
      { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
  { "tpope/vim-repeat",       lazy = false },
  { "tpope/vim-speeddating",  lazy = false },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'smoka7/hydra.nvim',
    },
    opts = {
      hint_config = {
        border = "rounded",
        position = 'bottom',
        show_name = false,
      }
    },
    keys = {
      {
        '<LEADER>m',
        '<CMD>MCstart<CR>',
        desc = 'multicursor',
      },
      {
        '<LEADER>m',
        '<CMD>MCvisual<CR>',
        mode = "v",
        desc = 'multicursor',
      },
      {
        '<C-Down>',
        '<CMD>MCunderCursor<CR>',
        desc = 'multicursor down',
      },
    },
  },
  {
    "airblade/vim-rooter",
    setup = function()
      vim.g.rooter_patterns = { ".git", "package.json", "yarn.lock", ".eslintrc.js", "jest.config.js" }
    end,
  },
  { "kylechui/nvim-surround", lazy = false, config = true },
  {
    "kevinhwang91/nvim-ufo",
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
    branch = "main",
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
    -- keys = {
    --   { "<Leader>gcb", '<cmd>GitConflictChooseBoth<CR>',   desc = 'choose both' },
    --   { "<Leader>gcn", '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
    --   { "<Leader>gco", '<cmd>GitConflictChooseOurs<CR>',   desc = 'choose ours' },
    --   { "<Leader>gcp", '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
    --   { "<Leader>gct", '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose theirs' },
    -- }
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
    -- Install via homebrew: brew install jesseduffield/lazygit/lazygit
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
    lazy = false,
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    opts = {
      show_help = "no",
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      },
    },
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
    keys = {
      { "<leader>ccb",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Buffer"
      },
      { "<leader>cco", "<cmd>CopilotChatOpen<cr>",      desc = "CopilotChat - Open" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      -- {
      --   "<leader>ccT",
      --   "<cmd>CopilotChatVsplitToggle<cr>",
      --   desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      -- },
      -- {
      --   "<leader>ccv",
      --   ":CopilotChatVisual",
      --   mode = "x",
      --   desc = "CopilotChat - Open in vertical split",
      -- },
      -- {
      --   "<leader>ccc",
      --   ":CopilotChatInPlace<cr>",
      --   mode = { "n", "x" },
      --   desc = "CopilotChat - Run in-place code",
      -- },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
    }
  },
  {
    'onsails/lspkind-nvim',
    config = function()
      require('plugins.lspkind')
    end,
  },
  {
    enabled = false,
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.lualine')
    end,
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
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("plugins.comment")
    end,
  },
  {
    "LudoPinelli/comment-box.nvim",
    lazy = false,
    keys = {
      { "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", desc = "comment box" },
      { "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", mode = "v",          desc = "comment box" },
    }
  },
  -- { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- Comment JSX properly
  {
    'lukas-reineke/indent-blankline.nvim', -- indent blankline correctly
    lazy = true,
    config = function()
      require("plugins.blankline")
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

  -- IDE Tools --
  {
    'folke/todo-comments.nvim',
    lazy = false,
    event = "BufEnter",
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    'David-Kunz/jester',
    lazy = false,
    enabled = false,
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
    lazy = true,
    dependencies = {
      { 'nvim-neotest/nvim-nio' },
      { 'nvim-lua/plenary.nvim' },
      { 'antoinemadec/FixCursorHold.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'nvim-neotest/neotest-jest' }
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
  {
    'mrded/nvim-lsp-notify',
    lazy = false,
    dependencies = 'rcarriga/nvim-notify',
    config = function()
      require('lsp-notify').setup({
        notify = require('notify'),
      })
    end
  },
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  }
}
