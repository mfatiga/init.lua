return {
  spec = {
    'rebelot/kanagawa.nvim',
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd [[colorscheme kanagawa-wave]]
    end
  },
  extras = {
    lazy_install = 'kanagawa-wave',
    lualine = 'kanagawa'
  }
}
