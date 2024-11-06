return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TodoTelescope", "TodoTrouble" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Search TODOs" }
  }
}
