local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }
  use {
    'zbirenbaum/copilot.lua',
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end
  }
  use 'nvim-lua/plenary.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter'
  }
  use {
    'L3MON4D3/LuaSnip',
    wants = 'friendly-snippets',
    after = 'nvim-cmp'
  }
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'navarasu/onedark.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use 'lewis6991/gitsigns.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'numToStr/Comment.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use {
    'lukas-reineke/indent-blankline.nvim',
    opt = true
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'David-Kunz/jester'
  use 'famiu/bufdelete.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'j-hui/fidget.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
