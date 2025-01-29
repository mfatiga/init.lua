return {
  theme = require("themes.kanagawa"),
  language_servers = {
    lua_ls = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
    nextls = {
      cmd = {"nextls", "--stdio"},
      init_options = {
        extensions = {
          credo = { enable = true }
        },
        experimental = {
          completions = { enable = true }
        },
      },
    },
    gopls ={ },
    zls = { },
    pyright = { },
    hls = {
      filetypes = { 'haskell', 'lhaskell', 'cabal' },
    },
    rust_analyzer = { },
  }
}
