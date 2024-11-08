return {
  'rmagatti/auto-session',
  cmd = {
    "SessionRestore",
    "SessionSave",
    "SessionSearch"
  },
  keys = {
    { '<leader>wr', '<cmd>SessionRestore<CR>', desc = 'Restore session' },
    { '<leader>ww', '<cmd>SessionSave<CR>', desc = 'Write session' },
    { '<leader>wf', '<cmd>SessionSearch<CR>', desc = 'Search sessions' },
  },
  opts = {
    auto_create = false,
    auto_restore_last_session = false,
  },
  config = function (_, opts)
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    require("auto-session").setup(opts)
  end
}
