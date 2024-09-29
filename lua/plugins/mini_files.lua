return {
  'echasnovski/mini.files',
  version = '*',
  opts = {
    -- Use `''` (empty string) to not create one.
    mappings = {
      close       = 'q',
      go_in       = '',
      go_in_plus  = '<CR>',
      go_out      = '',
      go_out_plus = '<BS>',
      mark_goto   = "'",
      mark_set    = 'm',
      reset       = '',
      reveal_cwd  = '@',
      show_help   = 'g?',
      synchronize = '=',
      trim_left   = '<',
      trim_right  = '>',
    },
    windows = {
      preview = true,
      width_focus = 40,
      width_nofocus = 20,
      width_preview = 50,
    },
    options = {
      use_as_default_explorer = false,
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>F",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  }
}
