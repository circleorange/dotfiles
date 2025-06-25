return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- require("lspconfig").pyright.setup({
		vim.lsp.config("pyright", {
			-- Defaults:
			-- cmd			= {"pyright-langserver", "--stdio"}
			-- root_files	= {"pyproject.toml", "setup.py", "requirements.txt", ".git"}
			-- filetypes	= {"python"}
			-- Enabled: single_file_support
			settings = { python = { analysis = {
					autoSearchPaths			= true,
					useLibraryCodeForTypes	= true,
					diagnosticMode			= "workspace",
			}}}
		})
	end -- <<< config
    },
    {
        -- Plugin to execute Python code interactively with Jupyter (.ipynb)
        -- Alternatives: dccsillag/magma-nvim (fork), Vigemus/iron.nvim
        "benlubas/molten-nvim",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end
    },
    {
        -- Plugin to render images in the terminal.
        "3rd/image.nvim",
        build = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            processor   = "magick_cli",
            backend     = "kitty",
            -- max_width   = 100,
            -- max_height  = 12,
            -- max_height_window_percentage    = math.huge,
            -- max_width_window_percentage     = math.huge,
            -- window_overlap_clear_enabled    = true, -- Toggle images when windows are overlapped
            -- window_overlap_clear_ft_ignore  = { "cmp_menu", "cmp_docs", ""},
        } -- <<< opts
    }
}
