return {
  {
    -- LuaLine
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          globalstatus = true,
          icons_enabled = true,
          theme = 'gruvbox-material',
          disabled_filetypes = { }
        },
        extensions = {
          'lazy', 'mason', 'nvim-tree', 'oil', 'quickfix'
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
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
        }
      }
    end,
  },
}
