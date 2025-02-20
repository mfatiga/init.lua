vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    require("lualine").refresh({ place = { "statusline" }, })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    local timer = vim.uv.new_timer()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        require("lualine").refresh({ place = { "statusline" }, })
      end)
    )
  end,
})

return {
  -- LuaLine
  'nvim-lualine/lualine.nvim',
  config = function ()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status')

    lualine.setup({
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = LeetVim.theme.extras.lualine,
        disabled_filetypes = { "ministarter", "alpha" }
      },
      extensions = {
        'lazy', 'mason', 'nvim-tree', 'oil', 'quickfix'
      },
      sections = {
        lualine_a = {
          'mode',
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == "" then return "" end
              return "REC @" .. reg
            end
          }
        },
        lualine_b = {
          'branch',
          {
            'diff',
            symbols = {
              added    = " ",
              modified = " ",
              removed  = " ",
            },
          },
          'diagnostics'
        },
        lualine_c = {
          {
            'filename',
            path=1
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e3b', },
          },
          'encoding',
          'fileformat',
        },
        lualine_y = {
          {
            'filetype',
            colored = true,
            icon_only = false,
            icon = { align = 'right' },
          }
        },
        lualine_z = {
          {
            'searchcount',
            maxcount = 999,
            timeout = 500,
            icon = { ' ', align = 'left' },
            padding = { left = 1, right = 1 }
          },
          {
            'progress',
            padding = { left = 1, right = 1 }
          },
          {
            'location',
            padding = { left = 1, right = 1 }
          },
        },
      },
      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      }
    })
  end
}
