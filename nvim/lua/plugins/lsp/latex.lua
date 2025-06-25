return {
	-- LSP support for LaTeX using taxlab
	{
		"neovim/nvim-lspconfig",
		ft				= {"tex", "plaintex", "latex", "bib"},
		dependencies	= {"williamboman/mason.nvim"},
		config			= function()
			require("texlab").setup({
				settings = { texlab = {
					build = {
						onSave				= true,
						forwardSearchAfter	= true,
					},
					forwardSearch = {
						executable	= "xdg-open", -- Or any other PDF viewer
						args		= {"--synctex-forward", "%l:1:%f", "%p"},
					},
				}}
			})
		end
	},
	-- Rich LaTeX features using lervag/vimtex
	-- Commands:
	-- <Cmd>VimtextInfo
	{
		"lervag/vimtex",
		lazy = false,
		ft = {"tex", "plaintex", "latex", "bib"},
	},
}
