return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP installer
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Require autocomplete to extend capabilities
      { 'saghen/blink.cmp' },
    },
    config = function()
      -- Initialize mason and auto-install
      require('mason').setup()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup {
        ensure_installed = LeetVim.language_servers,
        automatic_installation = true,
        automatic_enable = true
      }
    end
  },

  -- nvim dev
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
}
