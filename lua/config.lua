return {
  theme = require("themes.gruvbox_material"),
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
