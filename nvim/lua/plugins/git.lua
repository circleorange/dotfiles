return {
	-- Git UI
	-- Alternatives: snacks.nvim integrates lazygit for neovim
	-- 
	-- Commands:
	--		- <Cmd>Neogit				- Open status buffer in new tab
	--		- <Cmd>Neogit cwd=%:p:h		- Use repository of current file
	--		- <Cmd>Neogit commit		- Open commit dialogue
	--		- :DiffviewFileHistory		- File history for current branch.
	--		- :DiffviewFileHistory %	- File history for current file.
	--		- :DiffviewOpen				- Compare against current index.
	--		- :DiffviewClose			- Close current diffview.
	--		- :DiffviewToggleFiles		- Toggle file panel.
	--		- :DiffviiewRefresh			- Update entries in the file list of current diffview.
	--
	-- Usage:
	--		- <Tab> - Toggle folds
	--		- s - Stage
	--		- u - Undo
	--		- c - Open Commit dialogue (`c` commits changes in Commit mode, `q` finishes process)
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"folke/snacks.nvim",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup {
				disable_hint = false, -- Hide hints at the top of status buffer
				disable_context_hightlighting = false, -- Buffer highlights based on cursor focus
				disable_signs = false, -- Signs for selections, items, hunks
				disable_line_numbers = true, -- Line numbering
				disable_relative_line_numbers = true,
				prompt_force_push = true, -- Confirm to force push when brances diverged
				kind = "tab", -- Default way of opening neogit (tab | replace | split | floating | auto)

				-- Floating Window Style
				floating = {
					relative	= "editor",
					width		= 0.8,
					heights		= 0.7,
					style		= "minimal",
					border		= "rounded"
				},
			}
		end
	},
	-- Git for In-Line and CLI
	-- Features: Git signs, Hunk actions, Blame, Diff, Text Object, Status Line Integration.
	-- TODO: Add keymaps.
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup {
				signs = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '┃' },

					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged_enable = true,
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true

				},

				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				}
			}
		end,
	}
}
