local disabled_filetypes = { 'NvimTree' }

local function mini_files_open_parent(reveal_cwd, use_latest, cwd_fallback)
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  local is_valid_filetype = not vim.tbl_contains(disabled_filetypes, filetype)

  local path = nil
  if is_valid_filetype then
    path = vim.api.nvim_buf_get_name(0)
  elseif cwd_fallback then
    path = vim.uv.cwd()
  else
    return
  end

  local MiniFiles = require("mini.files")
  local _ = MiniFiles.close() or MiniFiles.open(path, use_latest)
  if reveal_cwd then
    vim.schedule(function()
      MiniFiles.reveal_cwd()
    end)
  end
end

return {
  'echasnovski/mini.files',
  version = false,
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
    options = {
      permanent_delete = true,
      use_as_default_explorer = false,
    },
    windows = {
      preview = true,
      width_focus = 40,
      width_nofocus = 20,
      width_preview = 50,
    },
  },
  keys = {
    {
      "<leader>ff",
      function() mini_files_open_parent(false, false, true) end,
      desc = "Open mini.files (dir of file)",
    },
    {
      "<leader>fd",
      function() mini_files_open_parent(true, false, true) end,
      desc = "Open mini.files (reveal CWD path)",
    },
    {
      "<leader>fp",
      function()
        local MiniFiles = require("mini.files")
        local _ = MiniFiles.close() or MiniFiles.open(vim.uv.cwd(), false)
      end,
      desc = "Open mini.files (CWD)",
    },
  }
}
