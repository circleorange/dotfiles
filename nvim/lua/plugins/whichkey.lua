return {
	"folke/which-key.nvim",
	event	= "VeryLazy",
	config	= function()

		require"which-key".add {
			{"<Leader>b", group = "[B]uffer"},
			{"<Leader>c", group = "[C]ode"},
			{"<Leader>d", group = "[D]iagnostics"},
			{"<Leader>e", group = "[E]xplorer"},
			{"<Leader>f", group = "[F]ind (Files, Project)"},
			{"<Leader>g", group = "[G]it"},
			{"<Leader>i", group = "[I]nspect"},
			{"<Leader>j", group = "Java"},
			{"<Leader>l", group = "[L]SP"},
			{"<Leader>L", group = "[L]azy"},
			{"<Leader>o", group = "[O]bsidian"},
			{"<Leader>p", group = "Python"},
			{"<Leader>s", group = "Search"},
			{"<Leader>t", group = "Terminal"},
			{"<Leader>u", group = "Toggle"},
		}
	end -- config
}

