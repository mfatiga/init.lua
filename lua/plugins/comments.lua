return {
  {
    -- "gc" to comment visual regions
    'numToStr/Comment.nvim',
    opts = {},
  },
  {
    -- highlight and search for todo/fix/bug/perfnote/warning comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function(_, opts)
      require("todo-comments").setup(opts)
      vim.keymap.set('n', '<leader>st', ":TodoTelescope<CR>", { desc = '[S]earch [T]ODOs' })
    end
  },
}
