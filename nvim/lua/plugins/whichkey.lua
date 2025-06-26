return {
	"folke/which-key.nvim",
	event	= "VeryLazy",
	config	= function()

		require"which-key".add {
			{"<Leader>a", group = "([A]vante) AI Features"},
			{"<Leader>b", group = "[B]uffer"},
			{"<Leader>c", group = "[C]ode"},
			{"<Leader>d", group = "[D]iagnostics"},
			{"<Leader>e", group = "[E]xplorer"},
			{"<Leader>f", group = "[F]ind (Files, Project)"},
			{"<Leader>g", group = "[G]it"},
			{"<Leader>i", group = "[I]nspect"},
			{"<Leader>j", group = "[J]ava"},
			{"<Leader>l", group = "[L]SP"},
			{"<Leader>L", group = "[L]azy"},
			{"<Leader>o", group = "[O]bsidian"},
			{"<Leader>p", group = "[P]ython"},
			{"<Leader>pn", group = "Python [N]otebooks"},
			{"<Leader>s", group = "[S]earch"},
			{"<Leader>t", group = "[T]erminal"},
			{"<Leader>u", group = "Toggle"},
		}
	end -- config
}

