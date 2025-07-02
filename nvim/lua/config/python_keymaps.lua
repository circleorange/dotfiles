-- Keymaps for Python and related functions Jupyter, Image Rendering, Notebooks

local set = require "utils.mapper".set_v2

set("n", "<Leader>pni", function()
    local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
    if venv ~= nil then
        venv = string.match(venv, "/.+/(.+)")
        vim.cmd(("MoltenInit %s"):format(venv))
    else
        vim.cmd("MoltenInit python3")
    end
end, "Initialise Python Kernel")
set("n", "<Leader>pnr", ":MoltenEvaluateOperator", "(Molten) Evaluate Operator")
set("n", "<Leader>pno", ":noautocmd MoltenEnterOutput", "(Molten) Open Output Window")

-- Quarto (LSP for Quarto format)
set("n", "<Leader>pnp", ":QuartoPreview", "(Quarto) Preview")
set("n", "<Leader>pnP", ":QuartoPreview", "(Quarto) Close Preview")
set("n", "<Leader>pnR", ":QuartoSend", "(Quarto) Run Cell")
set("n", "<Leader>pna", ":QuartoActivate", "(Quarto) Activate LSP")
set("n", "<Leader>pnq", ":QuartoDiagnostics", "(Quarto) Diagnostics")
