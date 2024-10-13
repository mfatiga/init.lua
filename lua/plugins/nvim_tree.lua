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
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeClose" },
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = '[T]ree [T]oggle' },
    { "<leader>to", "<cmd>NvimTreeFocus<CR>", desc = '[T]ree [O]pen' },
    { "<leader>tc", "<cmd>NvimTreeClose<CR>", desc = '[T]ree [C]lose' },
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
