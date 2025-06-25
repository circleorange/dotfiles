return {
	-- Collection of small quality-of-life plugins.
	--
	"folke/snacks.nvim",
	priority        = 1000,
	lazy            = false,
    dependencies    = {
        {"echasnovski/mini.icons", opts = {}}
    },
	opts = {
		bigfile     = {enabled = true}, -- Management of big files
		indent	    = {},	-- Show indent guides and scopes based on treesitter/ indent
		explorer    = {enabled = true},	-- File explorer
		health      = {enabled = true},
        -- Center input dialogue (command palette)
		input	    = {
            backdrop = false, position = "float", border = "rounded", title_pos = "center", height = 1, width = 60, relative = "editor", noautocmd = true,
            wo = { winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle", cursorline = false},
            bo = { filetype = "snacks_input", buftype = "promt" },
            b = { completion = false }, -- Buffer local variables
        },
		toggle	    = {enabled = true},	-- Toggle keymaps integrated with which-key icons/ colours
		picker	    = {enabled = true},	-- Used by other plugins, e.g. git branches
		scope	    = {enabled = true},	-- Scope detection, text objects, and jumping based on treesitter/ indent
		scroll	    = {enabled = true},	-- Smooth scrolling
		notifier    = {enabled = true},	-- Pretty notifications
		words	    = {enabled = true},	-- Auto-show LSP references and quickly navigate
		quickfile   = {enabled = true}, -- Improve start-up performance
        styles      = {},
	}, -- <<< opts
	keys = {
		-- Commands
		{"<Leader>;", function() Snacks.picker.commands() end, desc = "Commands"},
		{"<Leader>:", function() Snacks.picker.command_history() end, desc = "Command History"},
		{"<Leader>/", function() Snacks.picker.grep() end, desc = "Search string"},

		-- LSP
		{"gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to Definition"},
		{"gD", function() Snacks.picker.lsp_declaration() end, desc = "Go to Declaration"},
		{"gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Go to References"},
		{"gI", function() Snacks.picker.lsp_implementations() end, desc = "Go to Implementation"},
		{"gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Go to Type Definition"},
		{"<Leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols"},
		{"<Leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols"},
		-- {"<Leader>rn", function() Snacks.picker.rename() end, desc = "Rename Symbol"},

		-- File [E]xplorer
		{"<Leader>et", function() Snacks.picker.explorer() end, desc = "Toggle File Explorer"},

		-- [F]ile Search
		{"<Leader><Space>", function() Snacks.picker.smart() end, desc = "Smart File Finder"},
		{"<Leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffer"},
		{"<Leader>ff", function() Snacks.picker.files() end, desc = "Find File"},
		{"<Leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git File"},
		{"<Leader>fp", function() Snacks.picker.projects() end, desc = "Find Project"},
		{"<Leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent File"},
		{"<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File"},

		-- [S]earch
		{"<Leader>sb", function() Snacks.picker.lines() end, desc = "Search Buffer"},
		{"<Leader>sg", function() Snacks.picker.grep() end, desc = "Search string"},
		{"<Leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word"},
		{"<Leader>sh", function() Snacks.picker.help() end, desc = "Help Pages"},
		{"<Leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights"},
		{"<Leader>sl", function() Snacks.picker.loclist() end, desc = "Location List"},
		{"<Leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec"},
		{"<Leader>sq", function() Snacks.picker.qflist() end, desc = "Quick Fix List"},

		-- [G]it
		{"<Leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches"},
		{"<Leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status"},
		{"<Leader>gl", function() Snacks.lazygit() end, desc = "Open Lazygit"},
		{"<Leader>gB", function() Snacks.gitbrowse() end, desc = "Open Git in Browser"},

		-- [D]iagnostics
		{"<Leader>da", function() Snacks.picker.diagnostics() end, desc = "Dignostics"},
		{"<Leader>db", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Dignostics"},

		-- Misc / Other
		{"<Leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications"},
		{"<Leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File"},
		{"<Leader>tt", function() Snacks.terminal() end, desc = "Toggle Terminal"},
		{"<Leader>lh", function() Snacks.health.check() end, desc = "(Snacks) Chech [H]ealth"},
		{"<Leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer"},
		{"]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
		{"[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

        {"<leader>fv", function() Snacks.picker.files {
            cwd = vim.fn.stdpath("config")
        } end, desc = "(Picker) Fa[v]ourites"},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
                _G.dd = function(...) Snacks.debug.inspect(...) end
                _G.bt = function() Snacks.debug.backtrace() end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")

				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
