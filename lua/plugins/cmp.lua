return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',
  opts = {
    keymap = {
      show = '<C-space>',
      hide = '<C-e>',
      accept = '<CR>',
      select_prev = { '<S-Tab>', '<Up>' },
      select_next = { '<Tab>', '<Down>' },

      show_documentation = {},
      hide_documentation = {},
      scroll_documentation_up = '<C-f>',
      scroll_documentation_down = '<C-d>',

      snippet_forward = '<Tab>',
      snippet_backward = '<S-Tab>',
    },
    accept = {
      -- auto-brackets support
      auto_brackets = { enabled = true },
    },
    trigger = {
      -- experimental signature help support
      signature_help = { enabled = true },
      completion = {
        show_on_insert_on_trigger_character = false,
      },
    },
    windows = {
      autocomplete = {
        border = 'none',
        draw = 'reversed',
        -- 'preselect' will automatically select the first item in the completion list
        -- 'manual' will not select any item by default
        -- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
        selection = 'preselect',
      },
      documentation = {
        border = 'none',
      },
    },
    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },

    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    nerd_font_variant = 'normal',
  }
}
