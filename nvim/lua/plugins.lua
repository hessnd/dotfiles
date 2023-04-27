local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UI --
  use 'nvim-tree/nvim-web-devicons' -- Icons
  use 'navarasu/onedark.nvim'       -- Color Scheme
  use 'nvim-lualine/lualine.nvim'   -- Status Line
  use 'lewis6991/gitsigns.nvim'     -- Git Signs
  use 'norcalli/nvim-colorizer.lua' -- Highlight hex and rgb colors
  use {
    'nvim-tree/nvim-tree.lua',      -- File Explorer
    tag = 'nightly'
  }
  use 'akinsho/nvim-bufferline.lua'                 -- Bufferline
  use 'famiu/bufdelete.nvim'                        -- delete buffer without affecting layout
  use 'numToStr/Comment.nvim'                       -- Commenting
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Comment JSX properly
  use {
    'lukas-reineke/indent-blankline.nvim',          -- indent blankline correctly
    opt = true
  }
  use 'j-hui/fidget.nvim' -- LSP progress UI

  -- Integrated Terminal --
  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }

  -- Copilot
  use {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup({
        formatters = {
          insert_text = require('copilot_cmp.format').remove_existing
        }
      })
    end
  }

  -- Syntax Highlighting --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }

  -- LSP --
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'jay-babu/mason-null-ls.nvim' },
      { 'jose-elias-alvarez/typescript.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- use ({
  --   'glepnir/lspsaga.nvim',
  --   requires = { { 'nvim-tree/nvim-web-devicons'} }
  -- })
  use 'nvim-lua/plenary.nvim'           -- Neovim popups
  use 'onsails/lspkind-nvim'            -- VSCode pictograms
  use 'jose-elias-alvarez/null-ls.nvim' -- Inject linting/formatting and other code actions

  -- Telescope --
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- IDE Tools --
  use 'David-Kunz/jester'     -- Run Jest test inside neovim
  use 'windwp/nvim-autopairs' -- Autopair brackets and parens
  use 'dinhhuy258/git.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
