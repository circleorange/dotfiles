return
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim", -- Rendering and multiple views
        },
        opts = {
            lsp = {
                progress = { enabled = false }, -- Format LSP progress
                -- Override markdown rendering to have `cmp` and others use `nvim-treesitter`
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- Requires hrshth/nvim-cmp for completions
                }
            },
            presets = {
                bottom_search = true, -- Use classic bottom cmd line for search
                command_palette = true, -- Position cmd line and popup dialogue together
                long_message_to_split = true, -- Send long messages to split
                inc_rename = false, -- Enable input dialogue for inc-rename.nvim
                lsp_doc_border = false, -- Border around hober docs and signature help
            },
            -- Disable noice.nvim messages, Using snack.nvim instead
            messages = { enabled = false }, -- Message shown by LSP servers
            notify = { enabled = false }, -- Notifications
            hover = { enabled = false }, -- Hover docs
            signature = { enabled = false},
            documentation = { enabled = false },
        },
    }
