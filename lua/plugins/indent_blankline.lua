return {
  -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
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
