local M = {}

-- TODO: Could implement function to take in predefined data object with configurations
-- function M.set_v2(mode, key, fn, conf_struct) end
-- function ConfigStruct(fn_args, opts, auto_submit)
--    return { fn_args = fn_args, opts = opts, auto_submit = auto_submit} -- Support for custom logic, e.g. set opts.desc
-- end
function M.set(modes, key, fn, desc, opts, auto_submit)
    -- Combine default and new, if provided, opts and description
    local opts_default = { noremap = true, silent = false } -- Defaults if none provided
    local opts_combined
    if opts == nil then opts_combined = opts_default
    elseif type(opts) == "table" then opts_combined = opts
    else opts_combined = opts_default
    end
    opts_combined.desc = desc

    -- By default, automatically insert <Cr> to string type `fn`, unless specified otherwise
    local is_submit_supported   = (type(fn) == "string")
    local is_submit_enabled     = (is_submit_supported and auto_submit ~= false)
    local callback
    if is_submit_enabled then callback = fn .. "<Cr>"
    else callback = fn end

    vim.keymap.set(modes, key, callback, opts_combined)
end

-- Set key map for plugin
--
-- Usage:
--      >>> map( "n", "<Leader>ct", function() require("mini.trailspace").trim() end, { desc = "(Mini) Trim whitespace" })
--      <<< set("n", "<Leader>ct", require("mini.trailspace").trim, "(Mini) Trim whitespace")
--      Note function passed as `.trim`, not `.trim()` which would execute it.
--
function M.set_not_working(modes, key, fn, desc_or_opts, fn_args, auto_submit)
    -- Check if opts provided or only the description
    local opts = { noremap = true, silent = true } -- Defaults if none provided
    if type(desc_or_opts) == "string" then opts.desc = desc_or_opts
    elseif type(desc_or_opts) == "table" then for k, v in pairs(desc_or_opts) do opts[k] = v end end

    -- Check if the passed in `fn` argument is `require "plugin".some_fn` or `:SomePluginCommand<Cr>`
    local callback
    if type(fn) == "function" then
        if fn_args then callback = function() fn(unpack(fn_args)) end
        else callback = fn end
    elseif type(fn) == "string" then
        -- By default, append `<Cr>` to string type `fn` argument
        if auto_submit == nil or auto_submit then callback = fn .. "<Cr>"
        else callback = fn
        end
    else error("(Mapper) - set() - `fn` argument must be either function or string")
    end

    vim.keymap.set(modes, key, callback, opts)
end

-- Set key map for plugin requiring function call
-- Usage:
--      >>> map( "n", "<Leader>ct", function() require("mini.trailspace").trim() end, { desc = "(Mini) Trim whitespace" })
--      <<< fmap("n", "<Leader>ct", require("mini.trailspace").trim, "(Mini) Trim whitespace")
--      Note function passed as `.trim`, not `.trim()` which would execute it.
function M.fmap(modes, key, fn, desc, fn_args)
    local opts = {}
    if desc then opts.desc = desc end
    vim.keymap.set(modes, key, fn, opts)
end

-- Generic key mapper
function M.set_map(mode, key, fn, desc)
	vim.keymap.set(mode, key, fn, {desc = desc})
end

function M.map_old(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- create mode-specific shortcuts
for _, mode in ipairs({"n", "i", "v", "x", "t", "c"}) do
	M[mode .. "map"] = function(lhs, rhs, opts)
		M.map(mode, lhs, rhs, opts) -- reuse M.map but hardcode the mode
	end
end

return M

