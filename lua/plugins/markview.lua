return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    initial_state = false,
  },
  keys = {
    {
      "<leader>mt",
      "<cmd>Markview toggle<CR>",
      desc = "[M]arkdown preview toggle",
    },
    {
      "<leader>ms",
      "<cmd>Markview splitToggle<CR>",
      desc = "[M]arkdown split toggle",
    },
  }
}
