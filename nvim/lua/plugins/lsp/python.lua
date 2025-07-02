return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
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
        -- Features to convert ipynb files to plaintext file (e.g. md).
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        opts = {
            style = "markdown", output_extension = "md", force_ft = "markdown",
        },
    },
    {
        -- LSP features for executing python code embedded in file formats not supported by pyright (Jupyter, Markdown):
        --      Completions, formatting, diagnostics, cell code execution (otter.nvim)
        "quarto-dev/quarto-nvim",
        ft = { "quarto", "markdown" },
        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            debug = false,
            closePreviewOnExit = true,
            lspFeatures = {
                enabled     = true, chunks = "all", -- ("curly" | "all")
                languages   = { "python", "r" },
                diagnostics = { enabled = true, triggers = { "BufWritePost" } },
                completion  = { enabled = true },
            },
            codeRunner = {
                enabled = true,
                default_method = "molten",
                -- ft_runners = {}, -- Runners for specific file types, e.g. { python = "molten" }
                -- never_run = {}, -- Disable runners for specific file types, e.g. "yaml"
            },
        }, -- <<< opts
    },
    {
        -- Plugin to execute Python code interactively with Jupyter (.ipynb)
        -- Alternatives: dccsillag/magma-nvim (fork), Vigemus/iron.nvim
        "benlubas/molten-nvim",
        dependencies = {
            "3rd/image.nvim"
        },
        build = ":UpdateRemotePlugins",
        init = function()
            -- vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3") -- For use with venv
            vim.g.python3_host_prog=vim.fn.expand("~/miniconda3/envs/neovim/bin/python") -- For use with cenv
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end
    },
    {
        -- Support for images rendering in the terminal.
        "3rd/image.nvim",
        build = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            processor   = "magick_cli",
            backend     = "kitty",
            max_width   = 100,
            max_height  = 12,
            max_height_window_percentage    = math.huge,
            max_width_window_percentage     = math.huge,
            window_overlap_clear_enabled    = true, -- Toggle images when windows are overlapped
            window_overlap_clear_ft_ignore  = { "cmp_menu", "cmp_docs", ""},
        } -- <<< opts
    }
}
