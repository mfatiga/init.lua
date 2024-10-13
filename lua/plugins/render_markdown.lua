return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter", },
  cmd = {
    "RenderMarkdown",
  },
  keys = {
    {
      "<leader>mt",
      "<cmd>RenderMarkdown toggle<CR>",
      desc = "[M]arkdown preview toggle",
    },
  },
  opts = {
    -- don't auto render
    enabled = false,
  },
}
