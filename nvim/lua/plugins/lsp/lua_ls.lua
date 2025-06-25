return {
	-- Plugin to configure Lua language server, specifically for editing neovim configurations.
	-- Requirements: Uninstall or disable neodev.nvim
	--
	-- Commands:
	--		- <Cmd>LazyDev		- Show notification with lazydev settings for current buffer.
	--		- <Cmd>LazyDev lsp	- Show notification with lazydev settings for any attached LSP servers.
	--
	"folke/lazydev.nvim",
	ft = "lua", -- Only load for lua files
	cmd = "LazyDev",
	opts = {
		library = {
			{path = "${3rd}/luv/library", words = {"vim%.uv"}},
			{path = "snack.nvim", words ={"Snacks"}},
			{path = "lazy.nvim", words = {"LazyVim"}},
		},
	},
	config = function()
		-- Reference on vim.lsp.config: https://neovim.io/doc/user/lsp.html
		-- LSP merges configurations of `vim.lsp.config` in the following order (increasing priority):
		--	1. Configurations defined using '*', e.g. init.lua containing `vim.lsp.config("*", ...`
		--	2. Configurations returned by /lsp/{name}.lua files in rtp, e.g. {rtp}/lsp/python.lua
		--	3. Configurations defined anywhere else, e.g. init.lua but specifies `vim.lsp.config("pyright", ...`
		vim.lsp.config("lua_ls", {
			-- Defaults:
			--		> cmd			= {"lua-language-server"},
			--		> filetypes		= {"lua"},
			--		> root_markers	= {".luarc.json", "stylua.toml", ".git"},
			settings = { Lua = {
				runtime		= { version = { "LuaJIT" } },
				diagnostics = { globals = {"vim", "require", "Snacks"}},
				telemetry	= { enable = false },
				format		= {
					enable = true,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
					}
				},
			}}
		})
	end
}
