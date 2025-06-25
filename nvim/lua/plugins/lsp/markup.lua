return
    {
        {
            -- Integration with Zotero for Markdown for managing citations.
            -- 
            "jalvesaq/zotcite",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim",
                "hrsh7th/nvim-cmp",
                "jalvesaq/cmp-zotcite", -- Completion source for nvim-cmp, using zotcite as backend
            },
            config = function()
                require "zotcite".setup()
                require "cmp_zotcite".setup {
                    filetype = {
                        "pandoc", "markdown", "rmd", "quarto"
                    },
                }
                require "cmp".setup {
                    sources = {
                        { name = "cmp_zotcite" }
                    }
                }
            end -- <<< config
        },
        {
            -- Support from image pasting (either clipboard or drag-and-drop) into markup files.
            --
            "HakonHarnes/img-clip.nvim", event = "VeryLazy",
            opts = {
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = { insert_mode = true },
                    use_absolute_path = true, -- Required for Windows OS
                },
            },
            keys = {
                { "<Leader>mv", ":PasteImage", desc = "[P]aste image from clipboard" },
                -- Snacks.nvim Picker has built-in support for image preview
                { "<Leader>mp", function()
                    Snacks.picker.files {
                        ft = { "jpg", "jpeg", "png", "webp" },
                        confirm = function(self, item, _)
                            self:close()
                            require "img-clip".paste_image({}, "./" .. item.file)
                        end,
                    } end, desc = "(Snacks) [P]review media files in Picker"
                },
                { "<Leader>me", function()
                    local oil = require "oil"
                    local filename = oil.get_cursor_entry().name
                    local dir = oil.get_current_dir()
                    oil.close()
                    local img_clip = require "img-clip"
                    img_clip.paste_image({}, dir .. filename)
                end, desc = "(Oil) Paste image file from Explorer" },
            },
        },
        {
            -- Markdown LSP and browser live preview
            --
            -- Commands
            --      :RenderMarkdown toggle - Toggle state (Enable/ Disable) of the plugin.
            --
            "MeanderingProgrammer/render-markdown.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "echasnovski/mini.nvim",
            },
            opts = {
                enabled = true, -- Markdown rendering enabled by default
                -- In-Process LSP
                completions = {
                    lsp = { enabled = true }
                },
                latex = {
                    enabled = false,
                },
            }, -- <<< opts
            config = function(_, opts)
                require "render-markdown".setup(opts)

                local ts = require "nvim-treesitter"
                ts.install { "markdown", "markdown_inline" }
                -- Treesitter feautures need to be manually enabled
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "markdown", "markdown_inline" },
                    callback = function()
                        vim.treesitter.start() -- Syntax highlighting, provided by nvim-treesitter
                    end
                })
            end -- <<< config
        },
        {
            -- Plugin for writing and navigating Obsidian vaults.
            -- Features: Completion, Navigation, Images, Syntax highlighting, Concealing, References, Tages.
            --
            -- Commands:
            --      :ObsidianOpen {query}       - Open note in Obsidian app.
            --      :ObsidianNew {title}        - Create new note.
            --      :ObsidianQuickSwitch        - Quickly switch to (or open) another note in the vault.
            --      :ObsidianTags {tag ...}     - Open Picker with list of all given tags.
            --      :ObsidianSearch {query}     - Search for (or create) notes in the vault.
            --      :ObsidianBacklinks          - Open Picker with references to current buffer.
            --      :ObsidianLink {query}       - Link an inline visual selection of text to note.
            --      :ObsidianLinkNew {title}    - Create new note and link it to an inline visual selection of text.
            --      :ObsidianLinks              - Open Picker with links within current buffer.
            --      :ObsidianFollowLink {opt}   - Follow note reference under cursor, opt = {vsplit|hsplit}.
            --      :ObsidianWorkspace {name}   - Switch to another workspace.
            --      :ObsidianToggleCheckbox     - Toggle checkbox.
            --      :ObsidianTOC                - Open Picker with table of contents.
            --      :ObsidianPasteImg           - Handle attachments (Images)
            --
            -- References:
            --  > Integrate obsidian.nvim with image.nvim: https://github.com/3rd/image.nvim/issues/190#issuecomment-2378156235
            --
            "epwalsh/obsidian.nvim",
            version     = "*",
            lazy        = true,
            -- Only load obsidian.nvim for markdown files in Obsidian vault directory.
            event = {
                "BufReadPre " .. "/home/pbiel/repos/obsidian-vaults/masters/*.md",
                "BufNewFile " .. "/home/pbiel/repos/obsidian-vaults/masters/*.md",
            },
            dependencies = {
                "nvim-lua/plenary.nvim",            -- Required
                "nvim-telescope/telescope.nvim",    -- Search and Quick-Switch functionality
                "nvim-treesitter/nvim-treesitter",
                "hrsh7th/nvim-cmp",
            },
            opts = {
                mappings = {}, -- Empty table removes default key maps
                workspaces = {
                    { name = "Masters", path = "/home/pbiel/repos/obsidian-vaults/masters" }
                },
                -- Completions of Wiki links (`[[`), markdown links (`[`), and tags (`#`)
                -- > `min_chars` specified character threshold to trigger completions
                completion = { nvim_cmp = true, min_chars = 2 },
                picker = {
                    -- Picker alternatives: telescope.nvim, fzf-lua, mini.pick
                    name = "telescope.nvim",
                    note_mappings = {
                        new = "<C-x>", -- Create new note from query
                        insert_link = "<C-l>", -- Insert link to selected note
                    },
                    tag_mappings = {
                        tag_note = "<C-x>", -- Add tag(s) to current note
                        insert_tag = "<C-l>", -- Insert tag at current location
                    }
                },
                buffer = true,
                ui = {
                    enable = false, -- Syntax highlighting (Already covered by render-markdown, results in conflicts)
                },
            }, -- <<< opts
        }
    }
