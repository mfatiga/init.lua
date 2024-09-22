local vheader = {
"          .                                                      .",
"        .n                   .                 .                  n.",
"  .   .dP                  dP                   9b                 9b.    .",
" 4    qXb         .       dX                     Xb       .        dXp     t",
"dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb",
"9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP",
" 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP",
"  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'",
"    `9XXXXXXXXXXXP' `9XX'          `98v8P'          `XXP' `9XXXXXXXXXXXP'",
"        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~",
"                        )b.  .dbo.dP'`v'`9b.odb.  .dX(",
"                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.",
"                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb",
"                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb",
"                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP",
"                     `'      9XXXXXX(   )XXXXXXP      `'",
"                              XXXX X.`v'.X XXXX",
"                              XP^X'`b   d'`X^XX",
"                              X. 9  `   '  P )X",
"                              `b  `       '  d'",
"                               `             '"
}

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
      dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
      dashboard.button("n", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
      dashboard.button("l", " " .. " Plugins", "<cmd>Lazy<CR>"),
      dashboard.button("m", " " .. " Language Servers", "<cmd>Mason<CR>"),
      dashboard.button("q", " " .. " Quit", "<cmd>qa<CR>"),
    }


    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

    alpha.setup(dashboard.opts)
  end,
}
