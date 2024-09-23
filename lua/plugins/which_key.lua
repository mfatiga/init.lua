return {
  -- Show keymaps
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {},
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup(opts)
  end
}
