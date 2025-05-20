return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',
  opts = {
    keymap = {
      preset = 'none',

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-y>'] = { 'select_and_accept', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
        -- show_on_accept_on_trigger_character = false --TODO: maybe?
      },
      list = {
        selection = {
          -- preselect: when not in cmdline or snippet
          preselect = function (ctx)
            return ctx.mode ~= 'cmdline' and not require('blink.cmp').snippet_active()
          end,
          -- auto-insert: never
          auto_insert = false,
        },
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        -- don't auto-show in cmdline mode
        -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
        border = 'none',
        draw = {
          -- Aligns the keyword you've typed to a component in the menu
          align_to = 'label', -- or 'none' to disable, or 'cursor' to align to the cursor
          -- Left and right padding, optionally { left, right } for different padding on each side
          padding = 1,
          -- Gap between columns
          gap = 1,
          -- Components to render, grouped by column
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
        },
      },
      documentation = {
        auto_show = true,
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
        window = {
          border = 'none',
        },
      },
    },

    -- Experimental signature help support
    signature = {
      enabled = true,
      trigger = {
        -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = false,
      },
      window = {
        border = 'padded',
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
      },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
    },
  },
}
