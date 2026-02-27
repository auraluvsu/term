require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true,
    term_colors = true,
    no_italic = false,
    no_bold = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            LineNr = { fg = colors.overlay1 },
            CursorLineNr = { fg = colors.lavender, style = { "bold" } },
            Visual = { fg = "#daa520", bg = "NONE" },
            MatchParen = { fg = colors.peach, style = { "bold" } },
            DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
            DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
            DiagnosticUnderlineInfo = { undercurl = true, sp = colors.sky },
            DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        telescope =  false,
        indent_blankline = {
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = false,
        },
        lsp_trouble = true,
        mason = true,
        which_key = true,
        fidget = true,
        harpoon = true,
        markdown = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        },
    },
})
vim.cmd.colorscheme("catppuccin-mocha")
