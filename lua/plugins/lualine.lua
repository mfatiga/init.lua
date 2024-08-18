return {
  {
    -- LuaLine
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'gruvbox-material',
          disabled_filetypes = { 'packer', 'NvimTree' }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
            'filename',
            path=1
            }
          },
          lualine_x = {
            'encoding',
            'fileformat',
            {
              'filetype',
              colored = true,
              icon_only = false,
              icon = { align = 'right' },
            }
          },
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        tabline = {
          lualine_a = {'buffers'},
          lualine_b = {'branch'},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
        }
      }
    end,
  },
}
