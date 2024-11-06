return {
  -- Highlight, edit, navigate
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',

  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPre", "BufNewFile" },
  -- TODO: check if lazy load is working properly
  -- event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

  dependencies = {
    -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = { 'regex', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    -- List of parsers to ignore installing (for "all")
    ignore_install = { },
    highlight = {
      -- `false` will disable the whole extension
      enable = true,
      -- list of parsers that will be disabled
      disable = { },
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = { 'ruby' },
    },
    -- enable auto indentation
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end
}
