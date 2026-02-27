require("tokyonight").setup({
    -- use the night style
    style = "night",
    -- disable italic for functions
    transparent = true,
    terminal_colors = true,
    styles = {
        functions = {},
        comments = { italic = true },
    },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end,
    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.Visual = {
            bg = "NONE",
            fg = "#ff00ff",
        }
        hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
            bg = prompt,
        }
        hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl["@comment"] = {
            fg = c.green,
            italic = true,
        }
        hl["@lsp.type.parameter"] = {
            fg = c.green,
            italic = true,
        }
        hl.Type = {
            fg = "#ffd700",
        }
        hl["@variable"] = {
            fg = c.teal,
        }
        hl["@parameter"] = {
            fg = c.red,
        }
        hl["@lsp.type.parameter"] = {
            fg = c.red,
        }
        hl["@variable.builtin"] = {
            fg = "#fa2a55",
        }
        hl.Boolean = {
            fg = c.purple,
        }
        hl.String = {
            fg = c.orange,
        }
        hl.Number = {
            fg = c.purple,
        }
    end,
})
vim.cmd("colorscheme tokyonight-night")
