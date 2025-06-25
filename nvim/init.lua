-- Bootstrap lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system(
	    {"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath}
    )
    if vim.v.shell_error ~= 0 then error("Error cloning lazy.nvim:\n" .. out) end
end
vim.opt.rtp:prepend(lazypath)

-- load utils, basic settings, and keymaps
require "config.options"
require "config.keymaps"

-- Load plugins using lazy.nvim package manager.
-- lazy.nvim automatically calls setup() if only the `opts` field is specified,
-- Othwise, if `config` field exists, setup() needs to be called manually.
-- If both fields specified, `opts` need to be manually passed into setup() inside `config`
--
-- Plugin Spec
--      event : Specify an event (VeryLazy | InsertEnter) to load the plugin, e.g. event = "InsertEnter"
--      lazy  : Lazy load plugin when called with `require`
--      cmd   : Specify a command to load the plugin, e.g. cmd = "StartupTime"
--      ft    : Specify file type to load the plugin, e.g. ft = "norg"
--      init  : Called during startup, Specify neovim configurations for the plugin, e.g. vim.g.startuptime_tries=10
--      opts  : Specify plugin configuration, Automatically calls `require().setup(opts)` if `config` property not defined,
--      keys  : Lazy load plugin on keys, e.g. keys = {"J", ":TSJToggle<Cr>", desc = "Join Toggle"},
--
-- Commands:
--		:Lazy			- Show managed plugin information.
--		:Lazy install	- Install missing plugins, does not update existing ones.
--		:Lazy update	- Update plugins that are already installed.
--		:Lazy sync	    - Both install missing plugins, update all, and clean any unused plugins.
--
require("lazy").setup {

    -- General Editor
    require "plugins.git",
    require "plugins.motions",
    require "plugins.whichkey",
    require "plugins.file_explorer",
    require "plugins.ai",

	-- UI
    require "plugins.snacks",
    require "plugins.mini",
    require "plugins.ui.cursor",
    require "plugins.styles.theme",

    -- Language Server Protocols (LSP)
    require "plugins.lsp.lua_ls",
	require "plugins.lsp.python",
	require "lua.plugins.lsp.markup",
    -- require("lsp.java"), -- Disabled due to issues with Mason 2.0
	-- require("lsp.bash"),
	-- require("lsp.c"),
	-- require("lsp.docker"),
	-- require("lsp.latex"),
    require "plugins.lsp.lsp_config", -- Must run after LSP

    -- Code
    require "plugins.code.treesitter",
    require "plugins.code.completions",
}
vim.cmd.colorscheme "vague"

