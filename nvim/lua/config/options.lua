-- General
-- vim.opt.guifont = "Agave Nerd Font"
vim.opt.mouse = "a"               -- Enable mouse support in all modes
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.swapfile = false          -- Disable swap files
vim.opt.backup = false            -- Disable backup files
vim.opt.undofile = true           -- Enable persistent undo
vim.opt.autoread = true           -- Automatically re-read files if modified outside of Neovim

-- Appearance
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.termguicolors = true  -- Enable true color support
vim.opt.signcolumn = "yes"    -- Always show the sign column, otherwise it would shift the text
vim.opt.scrolloff = 8         -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8     -- Minimal number of screen columns to keep to the left and right of the cursor
vim.opt.showmode = false      -- Don't show mode since it's in the status line
vim.opt.conceallevel = 2      -- Value 0-3, Controls text concealment level, i.e. hide URL to show hypertext etc.

-- Text and Indentation
vim.opt.wrap        = true         -- Do not wrap lines
vim.opt.tabstop     = 4            -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4            -- Number of spaces that a <Tab> counts for when inserting a <Tab>
vim.opt.shiftwidth  = 4            -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab   = true         -- Use spaces instead of tabs
vim.opt.autoindent  = true         -- Copy indent from current line when starting a new line
vim.opt.smartindent = true         -- Make indenting smart

-- Code Folding
vim.opt.foldmethod = "expr" -- "indent" (Indent-based folding) | "syntax" (Requires syntax file) | "expr" (Treesitter, etc.)
vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.indentexpr = "nvim_treesitter#indentexpr()" -- Indentation, by nvim-treesitter
-- vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Indentation, by nvim-treesitter

-- Search
vim.opt.hlsearch   = true   -- Highlight all matches on search
vim.opt.incsearch  = true   -- Show search results incrementally
vim.opt.ignorecase = true   -- Ignore case in search patterns
vim.opt.smartcase  = true   -- Override 'ignorecase' if the search pattern contains uppercase letters

-- Windows
vim.opt.splitright = true   -- When splitting vertically, new window goes to the right
vim.opt.splitbelow = true   -- When splitting horizontally, new window goes to the bottom

-- Performance
vim.opt.updatetime = 2000 -- Duration to trigger cursor hover event (default is 4000ms)
-- opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete

