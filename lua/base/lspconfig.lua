-- Diagnostic config
vim.diagnostic.config({
  -- virtual_text = true,
  -- virtual_text = { current_line = true },
  virtual_lines = true,
  -- virtual_lines = { current_line = true },
})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostic Open Float' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic Set Loclist' })

-- On lsp attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    local kmap = function(mode, keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    kmap('n', 'grn', vim.lsp.buf.rename, 'Rename')
    kmap('n', 'gra', vim.lsp.buf.code_action, 'Code Action')
    kmap('n', 'gri', vim.lsp.buf.implementation, 'Goto Implementation')
    kmap('n', 'grr', vim.lsp.buf.references, 'References (Quickfix)')
    kmap('n', 'grR', require('telescope.builtin').lsp_references, 'Goto References')
    kmap('n', 'grd', vim.lsp.buf.definition, 'Goto Definition')
    kmap('n', 'grD', vim.lsp.buf.declaration, 'Goto Declaration')

    kmap('n', 'K', vim.lsp.buf.hover, 'Hover')
    kmap('n', 'gK', vim.lsp.buf.signature_help, 'Signature Documentation')
    kmap('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    kmap('n', '<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
    kmap('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    kmap('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
    kmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
    kmap('n', '<leader>wd', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
    kmap('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'Workspace List Folders')

    -- Create a command `:FormatLSP` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'FormatLSP', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end
})
