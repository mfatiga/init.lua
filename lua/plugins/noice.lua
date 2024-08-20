return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>sn", vim.cmd.NoiceTelescope, desc = '[S]earch [N]oice/[N]otifications' }
  },
  opts = {
    cmdline = {
      view = "cmdline_popup"
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = false
    },
    lsp = {
      progress = {
        enabled = true,
      },
      override = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
      },
    },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = { }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        render = "compact",
        stages = "fade",
        timeout = 3000,
      }
    }
  }
}
