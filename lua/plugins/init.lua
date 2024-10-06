return {
  -- Library used by other plugins
  { 'nvim-lua/plenary.nvim', lazy = true },

  -- Theme
  vim.tbl_extend('force', LeetVim.theme.spec, { lazy=false, priority = 1000 })
}
