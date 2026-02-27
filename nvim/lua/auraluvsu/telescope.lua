require('telescope').setup({
    defaults = {
        cwd = "~/projects/",
        file_ignore_patterns = {
            'node_modules',
            '%.git',
            'dist',
            'package%.json$',
            'package%-lock%.json$',
            'tsconfig%.json$',
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        -- This enables the border around Telescope windows
        border = true,
        borderchars = { '─', '│', '─', '│', '┌', '┐', '└', '┘' },  -- Customize border style if needed
        prompt_prefix = " ",
        selection_caret = " ",
        layout_config = {
            width = 0.9,
            height = 0.8,
        },
    },
    pickers = {
        live_grep = {
            hidden = true,
            file_ignore_patterns = {
                'node_modules',
                '%.git',
                'dist',
                'package%.json$',
                'package%-lock%.json$',
                'tsconfig%.json$',
            },
            cwd = "~/projects/",
        },
        find_files = {
            hidden = true,
            file_ignore_patterns = {
                'node_modules',
                '%.git',
                'dist',
                'package%.json$',
                'package%-lock%.json$',
                'tsconfig%.json$',
            },
            previewer = true,
            cwd = "~/projects/",
        },
    },
})

-- Ensure floating windows and Telescope have borders and transparent background
vim.api.nvim_set_hl(0, "NormalBorder", { fg = "NONE", bg = "NONE" }) -- Set color for border
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff00ff", bg = "NONE" }) -- Set color for border
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#ff00ff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ff00ff", bg = "NONE" })  -- Apply border styling to Telescope
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ffd700", bg = "NONE" })  -- Border color for prompt
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#000080", bg = "NONE" })  -- Border color for results
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = "#ffffff", bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = "NONE", bg = "NONE" })  -- Border color for preview
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#ffd700", bg = "NONE" })  -- Border color for preview
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#b59410", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#000000", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#000000", bg = "NONE", bold = true })
