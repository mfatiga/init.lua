return {
  -- Show keymaps
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern"
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
  },
}
