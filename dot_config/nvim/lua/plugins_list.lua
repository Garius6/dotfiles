vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Using Packer
  use 'navarasu/onedark.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use {
    "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
      require("toggleterm").setup()
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  --
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'mfussenegger/nvim-dap'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  vim.opt.completeopt = { "menu", "menuone", "noselect" }
end)
