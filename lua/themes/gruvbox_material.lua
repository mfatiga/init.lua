return {
  spec = {
    'sainnhe/gruvbox-material',
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd [[colorscheme gruvbox-material]]
    end,
  },
  extras = {
    lazy_install = 'gruvbox-material',
    lualine = 'gruvbox-material'
  },
}
