return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = false,
    columns = { "icon" },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["q"] = "actions.close",
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
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- Open parent directory in current window
    vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "File manager" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "File manager - floating" })
  end,
}
