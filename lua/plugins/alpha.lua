local function getCharLen(str, start_pos)
  local byte = string.byte(str, start_pos)
  if not byte then
    return nil
  end
  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

local function colorize(header, header_color_map, colors)
  for letter, color in pairs(colors) do
    local color_name = "AlphaCC" .. letter
    vim.api.nvim_set_hl(0, color_name, color)
    colors[letter] = color_name
  end
  local colorized = {}
  for i, line in ipairs(header_color_map) do
    local colorized_line = {}
    local pos = 0
    for j = 1, #line do
      local start = pos
      pos = pos + getCharLen(header[i], start + 1)
      local color_name = colors[line:sub(j, j)]
      if color_name then
        table.insert(colorized_line, { color_name, start, pos })
      end
    end
    table.insert(colorized, colorized_line)
  end
  return colorized
end

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    }
    local color_map = {
      [[                                             bb                      ]],
      [[      ggggggggggggggg           bbbbbbbbbbbbbbbbb                    ]],
      [[     ggggggggggggggg             bbbbbbbbbb                          ]],
      [[     gggggggggggggggggggggggggggggbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb  ]],
      [[    gggggggggggggggggggggggggggggggbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb  ]],
      [[   gggggggggggggggggggggggggggggggggbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb  ]],
      [[ ggggggggggggggggggggggggggggggggggggbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ]],
      [[ggggggggggggggggggggggggggggggggggggg bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb]],
    }
    local colors = {
      ["g"] = { fg = "#A6E3A1" },
      ["b"] = { fg = "#89B4FA" }
    }

    dashboard.section.header.val = header
    dashboard.section.header.opts.hl = colorize(header, color_map, colors)
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("n", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
      dashboard.button("g", " " .. " Git UI", "<cmd>LazyGit<CR>"),
      dashboard.button("p", " " .. " Plugins", "<cmd>Lazy<CR>"),
      dashboard.button("l", " " .. " Language Servers", "<cmd>Mason<CR>"),
      dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
    }

    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
