vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Lua utils
  use 'nvim-lua/plenary.nvim'

  -- LSP and Autocomplete
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP installer
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional

      -- Useful status updates for LSP
      {'j-hui/fidget.nvim', tag='legacy'},

      -- Additional lua configuration, makes nvim stuff amazing
      {'folke/neodev.nvim'},
    }
  }

  -- Highlight, edit, navigate
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Undo-tree
  use 'mbbill/undotree'

  -- Git stuff
  use 'lewis6991/gitsigns.nvim'

  -- Theme
  use 'sainnhe/gruvbox-material'

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- "gc" to comment visual regions
  use 'numToStr/Comment.nvim'

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
end)
