return {
	-- Language support for C/C++
	-- Commands:
	-- - <Cmd>ClangdSwitchSourceHeader<Cr>: Switch between header and source files.
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			vim.lsp.config("clangd", {
				cmd			= {"clangd"},
				filetypes	= {"c", "cpp"},
				root_dir	= function(fname)
					return require("lspconfig.util").root_pattern(
						"Makefile", "configure.ac", "meson.build", "build.ninja"
					)(fname) or require("lspconfig.util").root_pattern(
							"compile_commands.json", "compile_flags.txt", ".git"
						)(fname)
				end
			})
		end
	},
	-- Optional: Debug Adapter Protocol for C/C++
	{
		"mfussenegger/nvim-dap",
		ft = {"c", "cpp"},
		config = function ()
			local dap = require("dap")
			dap.adapters.cppdbg = {
				id			= "cppdbg",
				type		= "executable",
				command		= vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
			}
			dap.configurations.c = {
				{
					name	= "Launch File",
					type	= "cppdbg",
					request = "launch",
					program = function ()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = true,
				},
			}
			dap.configurations.cpp = dap.configurations.c
		end
	},
}
