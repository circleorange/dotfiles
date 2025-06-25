return {
	-- Tree-based syntax highlighting (https://github.com/nvim-treesitter/nvim-treesitter).
	--
	-- Commands:
	--		- <Cmd>TSInstall {lang}	- Install specific LSP, can be `all`.
	--		- <Cmd>TSUpdate			- Update all installed languages, or specify with {language}.
	--		- <Cmd>TSLog			- Show logs from previous installations, updates, and uninstalls.
    --		:TSContextToggle
	--
	"nvim-treesitter/nvim-treesitter",
	branch	= "main",
	lazy	= false,
	build	= ":TSUpdate",
	opts	= {
		ensure_installed = {
			"lua", "luadoc", "vim",
			"bash", "dockerfile",

			-- Data
			"yaml", "json", "toml", "xml",
            "regex",

			-- Frontend languages
			--"html",

			-- Backend languages
			--"c", "cpp", "cmake",
			--"java",
			"python",
		},
		highlight	= {enable = true},
		indent		= {enable = true},
	},
	config = function(_, opts)
		local ts = require "nvim-treesitter"
		ts.setup()
		ts.install(opts.ensure_installed)
		-- Treesitter feautures need to be manually enabled
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"lua", "python", "toml", "yaml"},
			callback = function()
				vim.treesitter.start() -- Syntax highlighting, provided by nvim-treesitter
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Folds, by Neovim
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Indentation, by nvim-treesitter
			end
		})
	end,
}
