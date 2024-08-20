return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
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
    opts = {
      scope = {
        enabled = false
      },
    },
  },
  -- Show keymaps
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup { }
    end
  },
  -- Zen mode
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.955,
        width = 160,
        options = {},
      },
      plugins = {
        options = {
          laststatus = 0
        },
        gitsigns = { enabled = true },
        todo = { enabled = true },
      },
      on_open = function (_)
        require("todo-comments").disable()
        vim.cmd("silent! IBLDisable")
      end,
      on_close = function ()
        require("todo-comments").enable()
        vim.cmd("silent! IBLEnable")
      end
    },
    config = function (_, opts)
      require("zen-mode").setup(opts)
      vim.keymap.set("n", "<leader>zz", function ()
        require("zen-mode").toggle()
      end)
    end
  },
  {
    "folke/twilight.nvim",
    opts = {
      context = 20,
    },
  },
}
