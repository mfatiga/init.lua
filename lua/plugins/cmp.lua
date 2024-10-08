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
      scroll_documentation_up = '<C-d>',
      scroll_documentation_down = '<C-f>',

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
        draw = 'reversed'
      },
      documentation = {
        border = 'single',
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
