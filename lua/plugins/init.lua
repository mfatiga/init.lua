return {
  -- Library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Icons for telescope, nvim-tree, lualine
  {
    'nvim-tree/nvim-web-devicons',
    priority=1000,
    enabled = vim.g.have_nerd_font
  },

  -- Theme
  {
    'sainnhe/gruvbox-material',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 999, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
}
