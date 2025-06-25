return {
	{
		-- File Explorer
		-- (Automated updates, Git integration, Diagnostics integration, Filtering)
		--
		-- Commands:
		--		:NvimTreeOpen		- Open file explorer,
		--		:NvimTreeToggle		- Toggle file explorer,
		--		:NvimTreeFocus		- Open file explorer if closed and then set focus,
		--		:NvimTreeFindFile	- Move cursor in the file explorer for current buffer
		--		:NvimTreeCollapse	- Collapse folds
		--
		"nvim-tree/nvim-tree.lua",
		enabled = false,
		dependencies = {
            {"echasnovski/mini.icons", opts = {}}
        },
		config = function()
			require("nvim-tree").setup {
				sort	= {sorter = "case_sensitive"},
				view	= {width = 30},
				renderer = {group_empty = true},
				filters = {dotfiles = true},
			}
		end,
	},
	{
        -- Alternative File Explorer (Floating)
        --
		"stevearc/oil.nvim",
		dependencies = {
            -- "nvim-tree/nvim-web-devicons",
            {"echasnovski/mini.icons", opts = {}}
        },
        lazy = false,
		config = function()
			require("oil").setup {
				use_default_keymaps = false,
				keymaps = {
					["<Cr>"]  = "actions.select",
					["-"]     = "actions.parent",
					["<C-h>"] = {"actions.toggle_hidden", mode = "n"},
					["<C-p>"] = "actions.preview",
					["<C-c>"] = {"actions.close", mode = "n"},
					["<C-r>"] = "actions.refresh",
					["?"]     = {"actions.show_help", mode = "n"},
				},
			}
		end,
	}
}

