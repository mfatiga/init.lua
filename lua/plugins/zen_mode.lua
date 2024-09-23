return {
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
      vim.keymap.set("n", "<leader>zz", function () require("zen-mode").toggle() end, { desc = 'Toggle [Z]en mode' })
    end
  },
  -- Gray out non-important lines in zen mode
  {
    "folke/twilight.nvim",
    opts = {
      context = 20,
    },
  },
}
