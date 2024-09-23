return {
  -- nvim-tree
  'nvim-tree/nvim-tree.lua',
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40
      },
      update_focused_file = {
        enable = true
      },
    })

    vim.keymap.set('n', '<leader>tt', require('nvim-tree.api').tree.toggle, { desc = '[T]ree [T]oggle' })
    vim.keymap.set('n', '<leader>to', require('nvim-tree.api').tree.focus, { desc = '[T]ree [O]pen' })
    vim.keymap.set('n', '<leader>tc', require('nvim-tree.api').tree.close, { desc = '[T]ree [C]lose' })
  end,
}
