local function is_dir_opened()
  local i = 0
  while i < vim.fn.argc(-1) do
    local path = vim.fn.argv(i, -1)
    if vim.fn.isdirectory(path) then return true end
  end
  return false
end

return {
  -- nvim-tree
  'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = not is_dir_opened(),
  cmd = { "NvimTreeToggle" },
  keys = {
    { "<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = 'Tree toggle' },
  },
  opts = {
    view = {
      width = 40
    },
    update_focused_file = {
      enable = true
    },
  },
}
