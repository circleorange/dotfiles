local servers = {
	"lua_ls",
	"pyright",
	"jdtls",
	"bashls",
	"lemminx",
	"clangd",
	"dockerls", "docker_compose_language_service",
}

-- These plugins are the ones that are exported and available in the deps module.
-- Instead of require("mason-tool-installer"), Use deps.mason_tools.
local plugin_map = {
	lspconfig		= "lspconfig",
	mason			= "mason",
	mason_lspconfig = "mason-lspconfig",
	mason_tools		= "mason-tool-installer",
    cmp				= "cmp",
	cmp_nvim_lsp	= "cmp_nvim_lsp",
    luasnip			= "luasnip",
	telescope		= "telescope",
	cmdline			= "fine-cmdline",
	java			= "java",
}

local M = {}
M.servers = servers

local plugin_set = {}

-- populate M and mod_set with mod_map
for plugin_var, plugin_name in pairs(plugin_map) do
	M[plugin_var] = nil
	plugin_set[plugin_var] = plugin_name
end

-- try require plugin, and return result if it's loaded, else return nil.
local function try_require(plugin_name)
	local ok, plugin = pcall(require, plugin_name)
	if ok then return plugin
	else return nil end
end

local function load_plugin_by_key(plug_key)
	M[plug_key] = try_require(plugin_set[plug_key])
end


local M_with_reload = {}

setmetatable(M_with_reload, {
	-- load plugins if requested property is nil
	__index = function(t, plug_key)
		if M[plug_key] == nil then load_plugin_by_key(plug_key) end
		return M[plug_key]
	end,
	-- optional, assignment goes into M as well
	__newindex = function(t, plug_key, value)
		M[plug_key] = value
	end
})

-- expose reload function if ever need to call it explicitly
M_with_reload.load_plugins = load_plugins

return M_with_reload

