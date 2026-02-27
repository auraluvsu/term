require("nvim-treesitter.configs").setup({
    ensure_installed = {"go", "lua", "typescript", "zig", "rust"}, -- Add the languages you need
    sync_install = false,
    auto_install = false,
    ignore_install = {}, -- You can leave this empty if you don't want to ignore any languages
    modules = {},
    highlight = {
        enable = true, -- Enables Treesitter-based highlighting
        additional_vim_regex_highlighting = false,
    },
})
