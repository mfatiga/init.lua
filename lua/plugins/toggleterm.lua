return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = {
    open_mapping = [[<M-t>]],
    direction = 'float',
    float_opts = {
      border = 'single',
      width = function ()
        return math.floor(vim.o.columns * 0.8)
      end,
      height = function ()
        return math.floor(vim.o.lines * 0.8)
      end,
    },
  }
}
