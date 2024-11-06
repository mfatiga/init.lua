return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = '┊' },
    scope = {
      enabled = true
    },
  },
}
