return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPre", "BufNewFile" },
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    scope = {
      enabled = false
    },
  },
}
