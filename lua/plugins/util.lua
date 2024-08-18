return {
  {
    -- "gc" to comment visual regions
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    -- Undo-tree
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Open [U]ndotree' })
    end,
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
  },
  {
    -- Git stuff
    'lewis6991/gitsigns.nvim',
  },
  {
    -- Show keymaps
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup { }
    end
  },
}
