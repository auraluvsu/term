-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', },
    { 'stevearc/conform.nvim', opts = {}, },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    { 'wakatime/vim-wakatime', lazy = false },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'Shadorain/shadotheme' },
    {"sindrets/diffview.nvim"},
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        opts = {
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
        },
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    { 'nvim-tree/nvim-web-devicons', },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8', -- Or branch = '0.1.x'
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { "folke/tokyonight.nvim" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
    },
    {"catppuccin/nvim"},
})
