return {
  "Vigemus/iron.nvim",
  ft = { "python", "elixir" },
  config = function ()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")
    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = { "python" },
            format = common.bracketed_paste,
          },
          elixir = {
            command = { "iex" },
          },
        },
        repl_open_cmd = view.split.botright("40%"),
      },
      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",

        send_motion = "<leader>rc",
        visual_send = "<leader>rc",
        send_file = "<leader>rf",
        send_line = "<leader>rl",

        cr = "<leader>r<cr>",
        interrupt = "<leader>r<space>",
        exit = "<leader>rq",
        clear = "<leader>rx",
      },
      ignore_blank_lines = true,
    })
  end,
}
