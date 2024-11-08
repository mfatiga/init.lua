return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP installer
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Require autocomplete to extend capabilities
      { 'saghen/blink.cmp' },
    },
    config = function()
      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic previous' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic next' })
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic Open Float' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic Set Loclist' })

      -- LSP on_attach
      local on_attach = function(_, bufnr)
        local kmap = function(mode, keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        kmap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
        kmap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code Action')

        kmap('n', 'gd', vim.lsp.buf.definition, 'Goto Definition')
        kmap('n', 'gr', require('telescope.builtin').lsp_references, 'Goto References')
        kmap('n', 'gI', vim.lsp.buf.implementation, 'Goto Implementation')
        kmap('n', '<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
        kmap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        kmap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

        kmap('n', 'K', vim.lsp.buf.hover, 'Hover')
        kmap('n', 'gK', vim.lsp.buf.signature_help, 'Signature Documentation')
        kmap('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        kmap('n', 'gD', vim.lsp.buf.declaration, 'Goto Declaration')
        kmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
        kmap('n', '<leader>wd', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
        kmap('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders')

        -- Create a command `:FormatLSP` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'FormatLSP', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- Autocomplete setup
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

      -- Servers
      local servers = LeetVim.language_servers

      -- Initialize mason and attach server config handlers
      require('mason').setup()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }
      mason_lspconfig.setup_handlers {
        function(server)
          local cfg = {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {},
          }

          local override_cfg = servers[server]
          if (override_cfg ~= nil) then
            for k, v in pairs(servers[server]) do cfg[k] = v end
          end

          require('lspconfig')[server].setup(cfg)
        end,
      }
    end
  },

  -- nvim dev
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },

  -- autocompletion
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      },
      sources = {
        -- add lazydev to your completion providers
        completion = {
          enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        },
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          lsp = { fallback_for = { 'lazydev' } },
          lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
        },
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
  },
}
