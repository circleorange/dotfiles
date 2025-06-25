return {
	-- Java language support: Spring Boot tools, Diagnostics, Autocompletion, Organise imports, Tests, Debug
	-- Dependencies: Uses nvim-lspconfig to setup jdtls and auto loads plugins.
	-- Cannot be installed alongside nvim-jdtls.
	-- Setup nvim-java before lspconfig; require("java").setup, only then require("lspconfig").jdtls.setup({})
	"nvim-java/nvim-java",
	ft = "java",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap", -- debug capabilities
	},
	opts = {
		root_markers = { "pom.xml", "settings.gradle", "settings.gradle.kts", ".git"},
		jdk = { auto_install = true, version = "^21.0.0" },
		jdtls = { version = "^1.43.0" },
	},
	config = function()
		require("java").setup({})
		-- jdtls onfigurations, e.g. settings.java.configuraiton.runtimes.{name = "Java21", path = "jdk", default = true}
		vim.lsp.config("jdtls", {
			settings = { java = { configuration = { runtimes = {
				{
					name = "Java21",
					path = "/usr/lib/jvm/java-21-openjdk",
					default = true,
				},
			}}}}
		})
	end
}
