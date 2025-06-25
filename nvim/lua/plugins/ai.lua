return {
    -- AI-powered code completions, in-line assistance, and chat.
    -- Supports connecting to locally running model.
    --
    -- Commands
    --  :AvanteAsk {Q} {Pos}    - Ask AI about code. Optionally, specify position, e.g. :AvanteAsk position=right "Refactor code"
    --  :AvanteBuild            - Build dependencies for the project.
    --  :AvanteChat             - Open chat session.
    --  :AvanteNewChat          - Start new chat session.
    --  :AvanteEdit             - Edit selected code blocks.
    --  :AvanteHistory          - Show previous chat sessions.
    --  :AvanteStop             - Stop current request
    --  :AvanteSwitchProvider   - Switch AI provider, given other are configured
    --  :AvanteShowRepoMap      - Show repo map for project structure
    --  :AvanteToggle           - Toggle sidebar
    --  :AvanteModels           - Show model list
    --
    "yetone/avante.nvim",
    build = function()
        if vim.fn.has("win32") == 1 then
            return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        else
            return "make"
        end
    end, -- <<< build
    event = "VeryLazy",
    version = false,
    opts = {
        provider = "ollama",
        providers = {
            ollama = {
                endpoint = "https://localhost:11434",
                model = "qwq:32b",
            },
            clause = {
                endpoint = "",
                model = "",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0.75, max_tokens = 20480,
                }
            },
        },
    }, -- <<< opts
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "echasnovski/mini.pick", -- Provider for file selector
        "hrsh7th/nvim-cmp", -- Completions for avante command and mentions
        "folke/snacks.nvim", -- Provider for input
        "echasnovski/mini.icons", -- Provider for icons
        "zbirenbaum/copilot.lua", -- Provider for copilot
    }, -- <<< dependencies
}
