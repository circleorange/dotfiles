local set = require "utils.mapper".set

vim.g.mapleader = " "

-- Markup
-- -- [I]mageClip
set("n", "<Leader>oi", ":PasteImage", "Paste [i]mage from clipoard")
-- -- [O]bsidian
set("n", "<Leader>oc", ":ObsidianToggleCheckbox", "Toggle [c]heckbox")
set("n", "<Leader>oC", ":ObsidianTOC", "Open Table of [C]ontents")
set("n", "<Leader>of", ":ObsidianFollowLink vsplit", "[F]ollow reference")
set("n", "<Leader>oF", ":ObsidianBacklinks", "Find references to current buffer")
set("n", "<Leader>ol", ":ObsidianLink ", "[L]ink visual selection", nil, false)
set("n", "<Leader>oL", ":ObsidianLinks", "Find [L]inks in current buffer")
-- set("n", "<Leader>oL", ":ObsidianLinkNew ", "Create and [L]ink note", nil, false)
set("n", "<Leader>on", ":ObsidianNew ", "[N]ew Note", nil, false)
set("n", "<Leader>oo", ":ObsidianOpen ", "[O]pen Note", nil, false)
set("n", "<Leader>oq", ":ObsidianQuickSwitch", "[Q]uick Switch")
set("n", "<Leader>os", ":ObsidianSearch ", "[S]earch or Create notes", nil, false)
set("n", "<Leader>ot", ":ObsidianTags ", "Find [t]ags", nil, false)
set("n", "<Leader>ow", ":ObsidianWorkspace ", "Open [W]orkspace", nil, false)
set("n", "<Leader>pmi", function()
    local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
    if venv ~= nil then
        venv = string.match(venv, "/.+/(.+)")
        vim.cmd(("MoltenInit %s"):format(venv))
    else
        vim.cmd("MoltenInit python3")
    end
end, "Initialise Python Kernel")

-- Misc
set("n", "<Leader>rl", ":luafile %",                "Run current Lua file")
set("t", "<Esc><Esc>", "<C-\\><C-n>",               "Exit Terminal Mode", nil, false)
set("n", "<Leader>ih", ":highlight",                "Inspect [H]ighlights")
set("n", "<Leader>um", ":RenderMarkdown toggle",    "Toggle Markdown Rendering")

-- [L]azy
set("n", "<Leader>Ll", ":Lazy",                     "(Lazy) Open UI")
set("n", "<Leader>Li", ":Lazy install",             "(Lazy) Install missing plugins")
set("n", "<Leader>Lu", ":Lazy update",              "(Lazy) Update current plugins")
set("n", "<Leader>Ls", ":Lazy sync",                "(Lazy) Install and Update all plugins")

-- [G]it
set("n", "<Leader>gd", ":DiffviewOpen",             "Open Git Diff View")
set("n", "<Leader>gD", ":DiffviewClose",            "Close Git Diff View")
set("n", "<Leader>gh", ":DiffviewFileHistory",      "Open Git history")
set("n", "<Leader>gr", ":DiffviewRefresh",          "Refresh Git entries")
set("n", "<Leader>go", ":Neogit",                   "Open Neogit UI")
set("n", "<Leader>gs", ":Gitsigns toggle_signs",    "Toggle Git signs")
set("n", "<Leader>gp", ":Gitsigns preview_hunk",    "Preview Hunk")
set("n", "<Leader>gB", ":Gitsigns blame_line",      "Show in-line Git blame")

-- File [E]xplorer
set("n", "<Leader>eo", ":Oil --float",              "(Oil) [O]pen File Explorer")
set("n", "-", ":Oil ..",                            "(Oil) Move up directory")

-- Window Management and Navigation
-- Split:
--		`<C-w>v`: Split
--		`<C-w>c`: Close
--		`<C-w>o`: Keep current split
--		`<C-w> hjkl`: Navigate between windows
set("n", "<S-Up>", ":resize +2",                    "(Window) Resize Up")
set("n", "<S-Down>", ":resize -2",                  "(Window) Resize Down")
set("n", "<S-Left>", ":vertical resize -2",         "(Window) Resize Left")
set("n", "<S-Right>", ":vertical resize +2",        "(Window) Resize Right")

-- Code Motions
vim.keymap.set({"n", "v"}, "<C-k>", ":Treewalker Up<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-j>", ":Treewalker Down<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-h>", ":Treewalker Left<Cr>", { silent = true })
vim.keymap.set({"n", "v"}, "<C-l>", ":Treewalker Right<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-k>", ":Treewalker SwapUp<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-j>", ":Treewalker SwapDown<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-h>", ":Treewalker SwapLeft<Cr>", { silent = true })
vim.keymap.set("n", "<C-S-l>", ":Treewalker SwapRight<Cr>", { silent = true })

-- Buffer nav & management
set("n", "<S-h>", ":bprevious",                     "(Buffer) Previous")
set("n", "<S-l>", ":bnext",                         "(Buffer) Next")
set("n", "<Leader>bb", "<Cmd>e #",                  "(Buffer) Switch")
set("n", "<Leader>bd", ":bd",                       "(Buffer) Close")

-- Code, Motions, Formatting
-- -- [L]SP
set("n", "<Leader>lc", ":CmpStatus",                "(LSP) Completions Status")
set("n", "<Leader>ld", vim.diagnostic.open_float,   "(LSP) Show Diagnostic popup")
set("n", "<leader>lr", vim.lsp.buf.rename,          "(LSP) Rename Symbol")
set("n", "<leader>li", ":LspInfo",                  "(LSP) Info")
-- -- Indentation
vim.keymap.set("v", "<", "<gv", { desc = "Increase Indentation" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease Indentation" })
-- -- Shifting
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<Cr>==", { desc = "Shift line up" })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<Cr>==", { desc = "Shift line down" })
vim.keymap.set("v", "<A-j>", "<Cmd>m '>+1<Cr>gv=gv", { desc = "Shift line up" })
vim.keymap.set("v", "<A-k>", "<Cmd>m '>-2<Cr>gv=gv", { desc = "Shift line down" })
-- -- Trailing whitespace
vim.keymap.set("n", "<Leader>ct", function() require("mini.trailspace").trim() end, { desc = "(Mini) Trim whitespace" })
vim.keymap.set("n", "<Leader>cT", function() require("mini.trailspace").trim_last_lines() end, { desc = "(Mini) Trim lines" })

-- [T]abs
vim.keymap.set("n", "<Leader>tn", ":tabnew<Cr>")
-- map("n", "<Leader>to", ":tabonly<Cr>", {desc = "Keep current tab"})
vim.keymap.set("n", "<Leader>tc", ":tabclose<Cr>")
vim.keymap.set("n", "<Leader>tm", ":tabmove ", { desc = "Move to Tab (specify index)" })

-- [J]ava
vim.keymap.set("n", "<Leader>js", "<Cmd>JavaSettingsChangeRuntime<Cr>", { desc = "Change JDK version" })
vim.keymap.set("n", "<Leader>jc", "<Cmd>JavaBuildBuildWorkspace<Cr>", { desc = "Run full workspace build" })
vim.keymap.set("n", "<Leader>jC", "<Cmd>JavaBuildCleanWorkspace<Cr>", { desc = "Clear the workspace" })
vim.keymap.set("n", "<Leader>jr", "<Cmd>JavaRunnerRunMain<Cr>", { desc = "Run application or selectedc main class" })
vim.keymap.set("n", "<Leader>jR", "<Cmd>JavaRunnerStopMain<Cr>", { desc = "Stop application" })
vim.keymap.set("n", "<Leader>jta", "<Cmd>JavaTestRunCurrentClass<Cr>", { desc = "Run test class in active buffer" })
vim.keymap.set("n", "<Leader>jtt", "<Cmd>JavaTestRunCurrentMethod<Cr>", { desc = "Run test under cursor" })
vim.keymap.set("n", "<Leader>jtr", "<Cmd>JavaTestViewLastReport<Cr>", { desc = "Open last test report in popup window" })
vim.keymap.set("n", "<Leader>jev", "<Cmd>JavaRefactorExtractVariable<Cr>", { desc = "Create variable from value at cursor/ selection" })
