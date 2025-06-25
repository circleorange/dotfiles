return {
	{
		-- Snippet engine (required by nvim-cmp for snippet expansions)
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",		-- Snippet source
			"rafamadriz/friendly-snippets", -- Snippet style
		},

	},
	{
		-- Completion Engine.
        --
        -- Commands:
        --      :CmpStatus  - Show loaded completion sources.
        --
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",				-- Load completions when entering Insert mode for efficiency
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",			-- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer",			-- Buffer words source
			"hrsh7th/cmp-path",				-- File path source
			"L3MON4D3/LuaSnip",             -- Alternatives (mini.snippets)
			"saadparwaiz1/cmp_luasnip",		-- LuaSnip snippet source
			"onsails/lspkind.nvim",			-- Customisation of completion popup (highlight groups)
		},
		config = function()
			local cmp		= require "cmp"
			local luasnip	= require "luasnip"
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup {
				-- Snippet engine
				snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },

				-- Snippet source (Can come in from multiple sources)
				--
				-- Other sources:
				--		> fuzzy_buffer	(buffer words)
				--		> fuzzy_path	(filesystem paths)
				--		> rg			(ripgrep results)
				--		> cmp-ai		(any AI completion/ chat to cmp)
				--
				sources = cmp.config.sources {
					{name = "nvim_lsp"},	-- cmp-nvim-lsp
					{name = "luasnip"},		-- cmp_luasnip
					{name = "buffer"},      -- Buffed-based completions
					{name = "path"},
					--{name = "lazydev", group_index = 0}, -- Group index 0 to skip loading LuaLS completions
				},

				-- Snippet keymaps
				mapping = cmp.mapping.preset.insert {
					["<C-Space>"]	= cmp.mapping.complete(),
					["<Cr>"]		= cmp.mapping.confirm({ select = false }),
					["<Tab>"]		= cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
						else fallback() end
					end, { "i","s" }),
					["<S-Tab>"]    = cmp.mapping(function(fallback)
						if cmp.visible() then cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then luasnip.jump(-1)
						else fallback() end
					end, { "i","s" }),
				},

				-- Snippet styles
				window = {
					completion		= cmp.config.window.bordered(),
					documentation	= cmp.config.window.bordered(),
				},

				-- Snippet formatting, Add Icon
				formatting = {
					fields = {"kind", "abbr", "menu"},
					format = function(entry, vim_item)
						local kind = require("lspkind").cmp_format({mode = "symbol_text", maxwidth = 50})(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", {trimempty = true})
						kind.kind = " "..(strings[1] or "").." "
						kind.menu = "    (" .. (strings[2] or "") .. ")"
						return kind
					end
				}
			} -- <<< cmp.setup
		end, -- <<< config
	},
}
