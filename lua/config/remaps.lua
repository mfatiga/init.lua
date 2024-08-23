-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better default experience
vim.keymap.set({ 'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move selected lines up/down - auto-indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected lines UP' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected lines DOWN' })

-- Paste overwrite selected
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste-overwrite selected' })

-- Yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = 'Begin yank to system clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Yank line to system clipboard' })

-- Delete to void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = 'Begin delete without clipboard' })

-- Search and replace
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and Replace' })

-- Quickfix nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = 'Quickfix next' })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = 'Quickfix previous' })
-- Loclist nav
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = 'Loclist next' })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = 'Loclist previous' })

-- Unbind Q
vim.keymap.set("n", "Q", "<nop>")

-- Delete buffer
vim.keymap.set("n", "<leader>bx", "<cmd>bd<CR><cmd>bn<CR>", { desc = 'Delete buffer and goto next' })
vim.keymap.set("n", "<leader>bX", "<cmd>bd!<CR><cmd>bn<CR>", { desc = 'Force delete buffer and goto next' })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = 'Delete buffer' })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = 'Force delete buffer' })
