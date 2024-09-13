return {
  -- highlight and search for todo/fix/bug/perfnote/warning comments
  "folke/todo-comments.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "[S]earch [T]ODOs" }
  }
}
