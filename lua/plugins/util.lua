return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    -- "gc" to comment visual regions
    'numToStr/Comment.nvim',
    opts = {},
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
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    -- Git gutter
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    -- lazygit integration
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
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
