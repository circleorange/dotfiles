return {
	"vague2k/vague.nvim",
	config = function()
		require("vague").setup {
			transparent = true, -- Set Background

			-- Globally toggle bold/italic, overrides `style`.
			bold	= true,
			italic	= true,

			style   = {
				-- "none" (default) / italic / bold
				boolean	     = "bold",
				number	     = "none",
				float		 = "none",
				error		 = "bold",
				comments	 = "italic",
				conditionals = "none",
				functions	 = "none",
				headings	 = "bold",
				operators	 = "none",
				strings		 = "italic",
				variables	 = "none",

				-- keywords
				keywords			= "none",
				keyword_return		= "italic",
				keywords_loop		= "none",
				keywords_label		= "none",
				keywords_exception	= "none",

				-- builtin
				builtin_constants	= "bold",
				builtin_functions	= "none",
				builtin_types		= "bold",
				builtin_variables	= "none",
			},

			-- Styling for specific plugins (Make PR for additional plugins).
			plugins = {
				cmp = {
					match				= "bold",
					match_fuzzy			= "bold",
				},
				dashboard = {
					footer				= "italic",
				},
				lsp = {
					diagnostic_error	= "bold",
					diagnostic_hint		= "none",
					diagnostic_info		= "italic",
					diagnostic_ok		= "none",
					diagnostic_warn		= "bold",
				},
				neotest = {
					focused				= "bold",
					adapter_name		= "bold",
				},
				telescope = {
					match				= "bold",
				},
			},

			-- Override highlights or add new highlights
			on_highlights = function(highlights, colors)
                highlights.LspReferenceRead = { bg = "#454545", underline = false }
                highlights.LspReferenceWrite = { bg = "#7e7e7e", underline = false }
            end,
            -- LspReferenceText: Any symbol reference, (e.g. text inside quotes).
            -- LspReferenceRead: Symbol is accessed, i.e. using the variable (require, vim).
            -- LspReferenceWrite: Symbol is assigned, i.e. generally, variable on LHS.

			-- Colours
            -- :highlight LspReferenceWrite guibg=#7c7c7e gui=NONE
			colors = {
				bg = "#141415", -- ColorColumn,
				fg = "#cdcdcd", -- CurSearch, Search, Affects colour of parenthesis, commas, dots
				floatBorder = "#878787",
				line = "#252530", -- CursorLine, CursorColumn,
				comment = "#5b5b5b", -- Comments, Matching Cursor Words
				builtin = "#b4d4cf",
				func = "#c48282",
				string = "#e8b589",
				number = "#e0a363",
				property = "#c3c3d5",
				constant = "#aeaed1",
				parameter = "#bb9dbd",
				visual = "#333738",
				error = "#d8647e",
				warning = "#f3be7c", -- Diagnostic Warning icon, undercurl
				hint = "#7e98e8",
				operator = "#90a0b5",
				keyword = "#6e94b2",
				type = "#9bb4bc",
				search = "#405065", -- Words matching search
				plus = "#7fa563",
				delta = "#f3be7c",
			},
		}
	end -- <<< config
}
