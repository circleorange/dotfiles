return {
    {
        -- Code montions in sytax tree aware manner.
        --
        -- Commands:
        --      :Treewalker {Up | Down | Left | Right}      - Move to neighbouring node
        --      :Treewalker Swap{Up | Down | Left | Right}  - Swap node
        --
        "aaronik/treewalker.nvim",
        opts = {
            highlight			= true,			-- briefly highlight node after jumping to it
            highlight_duration	= 250,
            highlight_group		= 'CursorLine', -- colour of the highlight
        },
    },
    -- Fast Code Navigation - Jump to character
    {
        "folke/flash.nvim",
        event	= "VeryLazy",
        opts	= {},
        keys	= {
            {"<Leader>cj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "(Flash) Jump to character" },
        },
    },
}
