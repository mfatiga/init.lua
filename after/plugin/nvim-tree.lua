require("nvim-tree").setup({
    view = {
        width = 40
    }
})

vim.keymap.set('n', '<leader>to', require('nvim-tree.api').tree.focus, { desc = '[T]ree [O]pen' })
vim.keymap.set('n', '<leader>tc', require('nvim-tree.api').tree.close, { desc = '[T]ree [C]lose' })
