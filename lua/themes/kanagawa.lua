return {
  spec = {
    'rebelot/kanagawa.nvim',
    opts = {
      theme = "wave",
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
      vim.opt.termguicolors = true
      vim.o.background = ""
      require("kanagawa").setup(opts)
      vim.cmd [[colorscheme kanagawa]]
    end
  },
  extras = {
    lazy_install = 'kanagawa',
    lualine = 'kanagawa'
  }
}
