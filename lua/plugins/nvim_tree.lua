return {
  -- nvim-tree
  'nvim-tree/nvim-tree.lua',
  version = "*",
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
