return {
  -- Library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Icons
  {
    'echasnovski/mini.icons',
    opts = {},
    lazy = false, -- make sure to load on startup
    priority=1000, -- make sure to load immediately
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- Theme
  {
    'sainnhe/gruvbox-material',
    lazy = false, -- make sure we load on startup
    priority = 999, -- make sure to load immediately
    config = function()
      vim.opt.termguicolors = true
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
}
