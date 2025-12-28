-- ~/.config/nvim/lua/plugins/catppuccin.lua
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- load before other UI plugins
        config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            term_colors = true,

            -- If you want terminal background to show through, flip this to true
            transparent_background = false,

            dim_inactive = { enabled = true, shade = "dark", percentage = 0.15 },

            -- Keep it clean: no forced italics/bold everywhere
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },

            integrations = {
                treesitter = true,
                telescope = true,
                mason = true,
                cmp = true,
                gitsigns = true,
                which_key = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "bold" },
                        warnings = { "bold" },
                        information = {},
                        hints = {},
                    },
                    underlines = {
                        errors = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        hints = { "underline" },
                    },
                    inlay_hints = { background = true },
                },
            },

            -- Retro terminal: neutralize mocha’s purple base + use green accent sparingly
            highlight_overrides = {
                mocha = function(C)
                local base = "#0e1113"      -- near-black, neutral (no purple tint)
        local mantle = "#111518"    -- slightly lifted layer
        local crust = "#0b0d0f"     -- deeper layer
        local surface0 = "#15191d"  -- cursorline
        local surface1 = "#1b2127"  -- visual selection

        return {
            -- Core
            Normal = { fg = C.text, bg = base },
            NormalNC = { fg = C.text, bg = base },
            NormalFloat = { fg = C.text, bg = mantle },
            FloatBorder = { fg = C.surface2, bg = mantle },

            -- Subtle focus/selection
            CursorLine = { bg = surface0 },
            CursorColumn = { bg = surface0 },
            Visual = { bg = surface1 },
            WinSeparator = { fg = "#222a31", bg = base },

            -- Numbers: terminal vibe
            LineNr = { fg = "#3a3f45" },
            CursorLineNr = { fg = C.green, bold = true },
            SignColumn = { bg = base },

            -- Search: “CRT glow” but not obnoxious
            Search = { fg = base, bg = C.green, bold = true },
            IncSearch = { fg = base, bg = C.lime, bold = true },

            -- Popups / menus
            Pmenu = { fg = C.text, bg = mantle },
            PmenuSel = { fg = base, bg = C.green, bold = true },
            PmenuSbar = { bg = crust },
            PmenuThumb = { bg = "#2a333b" },

            -- Statusline base (works with lualine; keeps bar dark)
        StatusLine = { fg = C.text, bg = base },
        StatusLineNC = { fg = C.overlay0, bg = base },

        -- Telescope (if you use it)
        TelescopeNormal = { fg = C.text, bg = mantle },
        TelescopeBorder = { fg = "#222a31", bg = mantle },
        TelescopePromptNormal = { fg = C.text, bg = mantle },
        TelescopePromptBorder = { fg = "#222a31", bg = mantle },

        -- Diagnostics: readable, not neon
        DiagnosticVirtualTextError = { fg = C.red, bg = "NONE" },
        DiagnosticVirtualTextWarn = { fg = C.yellow, bg = "NONE" },
        DiagnosticVirtualTextInfo = { fg = C.blue, bg = "NONE" },
        DiagnosticVirtualTextHint = { fg = C.teal, bg = "NONE" },
        }
        end,
            },
        })

        vim.cmd.colorscheme("catppuccin")

        -- Always re-apply this after colorscheme loads
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
            -- keep the current line number bold even if something overrides it
            vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
            end,
        })

        -- Apply once immediately (since ColorScheme autocmd triggers on future changes)
        vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true })
        end,
    },
}
