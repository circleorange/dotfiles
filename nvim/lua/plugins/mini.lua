return {
	-- Collection of small quality-of-life plugins.
	-- (ai, align, comment, completion, keymap, move, pairs, snippets, surround, pick, trailspace)
	--
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()

        -- Alginment of characters
        -- Functions:
        --      `ga`: Start alignment, or `gA` to start alignment with preview,
        --      's': Enter split pattern, e.g. `s=<Cr>` aligns LHS and RHS based on "="
        --      'j': Justify content, e.g. `jc` to center align, `jl` and `jr` for LHS and RHS
        --      `m`: Enter merge delimiter,
        --      `i`: Ignore some common unwated split matches,
        --      `p`: Aligned paired neighbouring parts
        --      `t`: Trim whitespace from parts
        --      `f`: Filter
        --
        -- Usage:
        --      `gaips=<Cr>`: `gaip` selects neighbouring parts, `s=<Cr>` aligns based on "=".
        --      `VipgAs=<Cr>`: `Vip` highlight pairing neighbouring parts, `gA` select with preview, `s=` align based on "=".
        --      `gAips=fcol>1`: `gAip` and `s=` as before, `f` open filter, `row > 1` means apply formatting start from row 2 (also "col").
        --
        require "mini.align".setup()

        -- Highlight text patterns (TODO, FIXME, NOTE, HACK)
        require "mini.hipatterns".setup {
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
                todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
                note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
                -- Highlight hex color strings (`#rrggbb`) using that color
                -- hex_color = hipatterns.gen_highlighter.hex_color(),
            }
        }

        -- Surround functionality for text objects
        --
        -- Functions:
        --      `sa` (Add) + motion/textobject + output id          : Add surrounding, e.g.         `saiw)` + word = (word)
        --      `sd` (Delete) + output id                           : Remove surrounding, e.g.      `sd]` + [word] = word
        --      `sr` (Replace) + input id (Find) + output id (Add)  : Replace surrounding, e.g.     `sr)]` + (word) = [word]
        --      `sh` (Highlight) + input id                         : Highligh surrounding, e.g.    `shf` to highlight function
        --      `sf` (Find) + input id                              : Find surrounding, e.g.        `sf}`
        --      `.` (Dot operator) repeats last action.
        --
        require "mini.surround".setup()

        -- Dev icons (similar to "nvim-tree/nvim-web-devicons")
        require "mini.icons".setup()

        -- Trim whitespaces
        -- Commands:
        --      - MiniTrailspace.trim()             - Trim all trailing whitespace
        --      - MiniTrailspace.trim_last_lines()  - Trim trailing empty lines
        require "mini.trailspace".setup()

		-- Enable automatic matching pairs
		require("mini.pairs").setup {
			modes = { insert = true, command = false, terminal = false },
		}

		-- Expand/ Shrink selection of textobjects
		--
		-- Usage:
		--		> vi"	- Select textobject inside ""
		--		> vi"i(	- Select textobject inside "", then expand selection to the next ()
        --
		require("mini.ai").setup {
			mappings = {
				-- Main textobject prefixes
				around = 'a',
				inside = 'i',
				-- Expand/ Shrink
				around_next = 'an',
				inside_next = 'in',
				around_last = 'al',
				inside_last = 'il',
				-- Move cursor to corresponding edge of 'a' textobject
				goto_left = 'g[',
				goto_right = 'g]',
			}
		}
	end
}
