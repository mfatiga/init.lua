# NeoVim config

![Lua autocomplete](screens/screen1.png)

Combined ideas and configs from [ThePrimeagen](https://github.com/ThePrimeagen/init.lua) and [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

Clone into `.config/nvim` and start NeoVim.
Dependencies:
 - fzf
 - luarocks

Features:
 - lazy for plugin management
 - telescope for search and navigation
 - file tree-view and file manager integrated
 - lsp with autocomplete
 - language server management integration using mason
 - treesitter for code analysis and coloring
 - undotree for undo history
 - lualine for bottom status line
 - comment for code commenting shortcuts
 - using gruvbox-material theme for all

## Customization
 - configure LSP servers at the top of [lua/plugins/lsp.lua](lua/plugins/lsp.lua)
 - configure theme settings in [lua/plugins/init.lua](lua/plugins/theme.lua)
 - set lualine theme in [lua/plugins/lualine.lua](lua/plugins/lualine.lua)


## Keybinds and commands
Here is a list of some of the custom binds and commands.


## Commands
| Command  | Description                |
| -------- | -------------------------- |
| `:Lazy`  | Plugin management          |
| `:Mason` | Language server management |


### General

| Mode | Keys        | Description                               |
| ---- | ----------- | ----------------------------------------- |
| n    | `K`         | Move selected lines UP with auto-indent   |
| n    | `J`         | Move selected lines DOWN with auto-indent |
| x    | `<Space>p`  | Paste-overwrite selected                  |
| n/v  | `<Space>y`  | Begin yank to system clipboard            |
| n    | `<Space>Y`  | Yank line to system clipboard             |
| n/v  | `<Space>d`  | Begin delete without clipboard            |
| n    | `<Space>ss` | Search and replace                        |
| n    | `<Ctrl-k>`  | Quickfix next                             |
| n    | `<Ctrl-j>`  | Quickfix previous                         |
| n    | `<Space>k`  | Loclist next                              |
| n    | `<Space>j`  | Loclist previous                          |


### File management

| Mode | Keys        | Description                |
| ---- | ----------- | -------------------------- |
| n    | `<Space>to` | Tree open and focus        |
| n    | `<Space>tc` | Tree close                 |
| n    | `-`         | oil.nvim file mgr          |
| n    | `<Space>-`  | oil.nvim file mgr floating |
| n    | `<Ctrl-c>`  | oil.nvim file mgr close    |
| n    | `<Space>lg` | open lazygit floating      |


### Telescope

| Mode | Keys             | Description                           |
| ---- | ---------------- | ------------------------------------- |
| n    | `<Space>sf`      | [S]earch [F]iles                      |
| n    | `<Space>sg`      | [S]earch [G]it files                  |
| n    | `<Space>sd`      | [S]earch [D]iagnostics                |
| n    | `<Space>sr`      | [S]earch by G[r]ep                    |
| n    | `<Space>sw`      | [S]earch current [W]ord               |
| n    | `<Space>sh`      | [S]earch [H]elp                       |
| n    | `<Space>/`       | [/] Fuzzily search in current buffer] |
| n    | `<Space>?`       | [?] Find recently opened files        |
| n    | `<Space><Space>` | [ ] Find existing buffers             |


### LSP

| Command   | Description                    |
| --------- | ------------------------------ |
| `:Format` | Format current buffer with LSP |

| Mode | Keys        | Description                 |
| ---- | ----------- | --------------------------- |
| n    | `<Space>rn` | [R]e[n]ame                  |
| n    | `<Space>ca` | [C]ode [A]ction             |
| n    | `gd`        | [G]oto [D]efinition         |
| n    | `gr`        | [G]oto [R]eferences         |
| n    | `gI`        | [G]oto [I]mplementation     |
| n    | `<Space>D`  | Type [D]efinition           |
| n    | `<Space>ds` | [D]ocument [S]ymbols        |
| n    | `<Space>ws` | [W]orkspace [S]ymbols       |
| n    | `K`         | Hover Documentation         |
| n    | `<Ctrl-k>`  | Signature Documentation     |
| n    | `gD`        | [G]oto [D]eclaration        |
| n    | `<Space>wa` | [W]orkspace [A]dd Folder    |
| n    | `<Space>wr` | [W]orkspace [R]emove Folder |
| n    | `<Space>wl` | [W]orkspace [L]ist Folders  |


### Autocomplete

| Keys           | Description                |
| -------------- | -------------------------- |
| `<Ctrl-d>`     | Scroll docs -4             |
| `<Ctrl-f>`     | Scroll docs +4             |
| `<Ctrl-Space>` | Show autocomplete dialog   |
| `<Enter>`      | Confirm autocomplete       |
| `<Tab>`        | Next item / Snip next jump |
| `<Shift-Tab>`  | Prev item / Snip prev jump |


### Diagnostic

| Mode | Keys       | Description              |
| ---- | ---------- | ------------------------ |
| n    | `<Space>q` | Open diagnostic details  |
| n    | `<Space>e` | Open diagnostics loclist |
| n    | `[d`       | Diagnostic goto prev     |
| n    | `]d`       | Diagnostic goto next     |


### Undotree

| Mode | Keys       | Description     |
| ---- | ---------- | --------------- |
| n    | `<Space>u` | Open [U]ndotree |


### Commenting

| Mode | Keys  | Description                       |
| ---- | ----- | --------------------------------- |
| n    | `gcA` | Comment insert end of line        |
| n    | `gcO` | Comment insert above              |
| n    | `gco` | Comment insert below              |
| x    | `gb`  | Comment toggle blockwise (visual) |
| x    | `gc`  | Comment toggle linewise (visual)  |
| n    | `gbc` | Comment toggle current block      |
| n    | `gcc` | Comment toggle current line       |
| n    | `gb`  | Comment toggle blockwise          |
| n    | `gc`  | Comment toggle linewise           |
