# NeoVim config

![Lua autocomplete](screens/screen1.png)

Clone into `.config/nvim` and start NeoVim.
Dependencies:
 - fzf
 - fd
 - luarocks
 - lazygit

Features:
 - lazy for plugin management
 - telescope for search and navigation
 - file tree-view and file manager integrated
 - lsp with autocomplete
 - language server management integration using mason
 - treesitter for code analysis and coloring
 - lualine for bottom status line
 - customizable theme


## TODO
 - replace alpha.nvim with [echasnovski/mini.starter](https://github.com/echasnovski/mini.starter)
 - integrate [echasnovski/mini.surround](https://github.com/echasnovski/mini.surround)
 - integrate [echasnovski/mini.sessions](https://github.com/echasnovski/mini.sessions)
 - integrate [DanWlker/toolbox.nvim](https://github.com/DanWlker/toolbox.nvim)
 - integrate [Vigemus/iron.nvim](https://github.com/Vigemus/iron.nvim) or [michaelb/sniprun](https://github.com/michaelb/sniprun)
 - integrate [rmagatti/auto-session](https://github.com/rmagatti/auto-session)
 - look at [pwnwriter/pwnvim](https://github.com/pwnwriter/pwnvim) for config hints


## Customization
 - configure LSP servers in [lua/config.lua](lua/config.lua)
 - set theme in [lua/config.lua](lua/config.lua)
 - create/override theme settings in [lua/themes/](lua/themes/)


## Keybinds and commands
Here is a list of some of the custom binds and commands.


## Commands

| Command  | Description                |
| -------- | -------------------------- |
| `:Lazy`  | Plugin management          |
| `:Mason` | Language server management |


### Text-objects
Using mini.ai for extended textobjects.
 - defines mappings for both `a` and `i` in `v` and `o` mode

Default textobject is activated for identifiers from digits (0, ..., 9), punctuation (like `_`, `*`, `,`, etc.), whitespace (space, tab, etc.)

| Key |      Name                   |
| --- | ---------------             |
|     | Default                     |
| `(` | Balanced ()                 |
| `[` | Balanced []                 |
| `{` | Balanced {}                 |
| `<` | Balanced <>                 |
| `)` | Balanced ()                 |
| `]` | Balanced []                 |
| `}` | Balanced {}                 |
| `>` | Balanced <>                 |
| `b` | Alias for ),],}             |
| `"` | Balanced "                  |
| `'` | Balanced '                  |
|  `  | Balanced `                  |
| `q` | Alias for ",',`             |
| `?` | User prompt (typed e and o) |
| `t` | Tag                         |
| `f` | Function call               |
| `a` | Argument                    |


### General

| Mode | Keys         | Description                                     |
| ---- | ------------ | ----------------------------------------------- |
| n    | `K`          | Move selected lines UP with auto-indent         |
| n    | `J`          | Move selected lines DOWN with auto-indent       |
| x    | `<Space>p`   | Paste-overwrite selected                        |
| n/v  | `<Space>y`   | Begin yank to system clipboard                  |
| n    | `<Space>Y`   | Yank line to system clipboard                   |
| n/v  | `<Space>d`   | Begin delete without clipboard                  |
| n    | `<Space>ss`  | Search and replace                              |
| n    | `<Ctrl-k>`   | Quickfix next                                   |
| n    | `<Ctrl-j>`   | Quickfix previous                               |
| n    | `<Space>k`   | Loclist next                                    |
| n    | `<Space>j`   | Loclist previous                                |
| n    | `<Space>bx`  | Delete current buffer and switch to next        |
| n    | `<Space>bX`  | Force delete current buffer and switch to next  |
| n    | `<Space>bd`  | Delete current buffer                           |
| n    | `<Space>bD`  | Force delete current buffer                     |
| n    | `<Space><CR>`| Alternate buffer (:e #)                         |
| n    | `<Space>zz`  | Zen-Mode                                        |
| n    | `<Space>?`   | Buffer Keymaps                                  |


### Movement

| Mode  | Keys       | Description                        |
| ----- | ---------- | ---------------------------------- |
| n/x/o | `s`        | Flash - jump                       |
| n/x/o | `S`        | Flash - treesitter                 |
| o     | `r`        | Flash - remote (in o-pending mode) |
| o/x   | `R`        | Flash - treesitter search          |
| c     | `<Ctrl-s>` | Toggle Flash Search                |


### Telescope

| Mode | Keys             | Description                      |
| ---- | ---------------- | -------------------------------- |
| n    | `<Space><Space>` | Search buffers                   |
| n    | `<Space>sf`      | Search Files                     |
| n    | `<Space>sg`      | Search Git files                 |
| n    | `<Space>sr`      | Search by Grep                   |
| n    | `<Space>s.`      | Search recently opened files     |
| n    | `<Space>sw`      | Search current Word              |
| n    | `<Space>sd`      | Search Diagnostics               |
| n    | `<Space>st`      | Search TODO                      |
| n    | `<Space>sT`      | Search TODO/FIX/FIXME            |
| n    | `<Space>sn`      | Search Noice/Notifications       |    
| n    | `<Space>sh`      | Search Help                      |
| n    | `<Space>sk`      | Search Keymaps                   |
| n    | `<Space>su`      | Search Undo-tree                 |
| n    | `<Space>/`       | Fuzzily search in current buffer |


### LSP

| Command      | Description                    |
| ------------ | ------------------------------ |
| `:FormatLSP` | Format current buffer with LSP |

| Mode | Keys        | Description             |
| ---- | ----------- | ----------------------- |
| n    | `<Space>rn` | Rename                  |
| n    | `<Space>ca` | Code Action             |
| n    | `gd`        | Goto Definition         |
| n    | `gr`        | Goto References         |
| n    | `gI`        | Goto Implementation     |
| n    | `<Space>D`  | Type Definition         |
| n    | `<Space>ds` | Document Symbols        |
| n    | `<Space>ws` | Workspace Symbols       |
| n    | `K`         | Hover                   |
| n    | `gK`        | Signature Documentation |
| i    | `<Ctrl-k>`  | Signature Documentation |
| n    | `gD`        | Goto Declaration        |
| n    | `<Space>wa` | Workspace Add Folder    |
| n    | `<Space>wr` | Workspace Remove Folder |
| n    | `<Space>wl` | Workspace List Folders  |


### Autocomplete

| Keys           | Description                |
| -------------- | -------------------------- |
| `<Ctrl-d>`     | Scroll docs up             |
| `<Ctrl-f>`     | Scroll docs down           |
| `<Ctrl-Space>` | Show autocomplete dialog   |
| `<Ctrl-e>`     | Close autocomplete dialog  |
| `<Enter>`      | Accept autocomplete        |
| `<Tab>`        | Next item / Snip next jump |
| `<Shift-Tab>`  | Prev item / Snip prev jump |


### Diagnostic

| Mode | Keys       | Description              |
| ---- | ---------- | ------------------------ |
| n    | `<Space>q` | Open diagnostic details  |
| n    | `<Space>e` | Open diagnostics loclist |
| n    | `[d`       | Diagnostic goto prev     |
| n    | `]d`       | Diagnostic goto next     |


### Trouble

| Mode | Keys        | Description                    |
| ---- | ----------- | ------------------------------ |
| n    | `<Space>cs` | Symbols                        |
| n    | `<Space>cS` | LSP references/definitions/... |
| n    | `<Space>td` | Diagnostics                    |
| n    | `<Space>tD` | Buffer Diagnostics             |
| n    | `<Space>tl` | Location List                  |
| n    | `<Space>tq` | Quickfix List                  |
| n    | `<Space>ts` | Telescope Results              |
| n    | `<Space>tt` | TODO                           |
| n    | `<Space>tT` | TODO/FIX/FIXME                 |
| n    | `[q`        | Previous Trouble/Quickfix Item |
| n    | `]q`        | Next Trouble/Quickfix Item     |
| n    | `[t`        | Previous TODO comment          |
| n    | `]t`        | Next TODO comment              |


### File management

| Mode | Keys        | Description                    |
| ---- | ----------- | ------------------------------ |
| n    | `<Space>ff` | mini.files - file dir          |
| n    | `<Space>fd` | mini.files - file dir expanded |
| n    | `<Space>fp` | mini.files - project dir       |
| n    | `<Space>ft` | treeview toggle                |
| n    | `<Space>lg` | open lazygit floating          |


### Markdown

| Mode | Keys | Description             |
| ---- | ---- | ----------------------- |
| n    | `mt` | Markdown preview toggle |
