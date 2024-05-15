require("oil").setup {
    default_file_explorer = false,
    columns = { "icon" },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort"
    },
    use_default_keymaps = false,
    view_options = {
        show_hidden = true,
    },
}

-- Open parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "File manager" })

-- Open parent directory in floating window
vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "File manager - floating" })
