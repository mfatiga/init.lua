return {
  -- Zen mode
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
      { "<leader>zz", "<cmd>ZenMode<CR>", desc = 'Toggle [Z]en mode' },
    },
    dependencies = {
      -- Gray out non-important lines in zen mode
      {
        "folke/twilight.nvim",
        opts = {
          context = 20,
        },
      },
    },
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
  },
}
