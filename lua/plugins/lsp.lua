return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP installer
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
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

        kmap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        kmap('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        kmap('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        kmap('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        kmap('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        kmap('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        kmap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        kmap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        kmap('n', 'K', vim.lsp.buf.hover, 'Hover')
        kmap('n', 'gK', vim.lsp.buf.signature_help, 'Signature Documentation')
        kmap('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        kmap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        kmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        kmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        kmap('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Create a command `:FormatLSP` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'FormatLSP', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- Autocomplete setup
      local capabilities = vim.lsp.protocol.make_client_capabilities()

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
  -- TODO: check integration with blink_cmp
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
}
