return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'debugloop/telescope-undo.nvim' },
  },
  cmd = { "Telescope" },
  keys = {
    -- See `:help telescope.builtin`
    { '<leader><leader>', "<cmd>Telescope buffers<CR>",  desc = '[ ] Find existing buffers' },
    { '<leader>sf', "<cmd>Telescope find_files<CR>", desc = '[S]earch [F]iles' },
    { '<leader>sg', "<cmd>Telescope git_files<CR>", desc = '[S]earch [G]it files' },
    { '<leader>sh', "<cmd>Telescope help_tags<CR>", desc = '[S]earch [H]elp' },
    { '<leader>sw', "<cmd>Telescope grep_string<CR>", desc = '[S]earch current [W]ord' },
    { '<leader>sr', "<cmd>Telescope live_grep<CR>", desc = '[S]earch by G[r]ep' },
    { '<leader>sd', "<cmd>Telescope diagnostics<CR>", desc = '[S]earch [D]iagnostics' },
    { '<leader>sk', "<cmd>Telescope keymaps<CR>", desc = '[S]earch [K]eymaps' },
    { '<leader>s.', "<cmd>Telescope oldfiles<CR>", desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader>/',  "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = '[/] Fuzzily search in current buffer' },

    -- extension mappings
    { '<leader>su', "<cmd>Telescope undo<CR>", desc = '[S]earch [U]ndo-tree' },
  },
  config = function()
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")
    require('telescope').setup {
      defaults = themes.get_ivy {
        layout_config = {
          height = function(_, _, max_lines)
            return math.floor(max_lines * 0.6)
          end,
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      pickers = {
        buffers = {
          sort_mru = true,
          sort_lastused = false,
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          themes.get_dropdown(),
        },
        ['undo'] = {
          vim_diff_opts = {
            ctxlen = 8
          },
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'undo')
  end,
}
