return {
  theme = require("themes.kanagawa"),
  language_servers = {
    pyright = {},
    elixirls = {},
    rust_analyzer = {},
    hls = {
      filetypes = { 'haskell', 'lhaskell', 'cabal' },
    },
    gopls ={},
    lua_ls = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
  }
}
