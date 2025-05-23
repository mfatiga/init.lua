return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TodoTelescope", "TodoTrouble" },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>tt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>tT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<CR>", desc = "Search TODO" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Search TODO/FIX/FIXME" },
  }
}
