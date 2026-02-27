require("auraluvsu.lazy")
require("auraluvsu.set")
require("auraluvsu.remap")
require("auraluvsu.lsp")
-- require("auraluvsu.tokyonight")
require("auraluvsu.sakura")
-- require("auraluvsu.catppuccin")
require("auraluvsu.treesitter")
require("auraluvsu.cmp")
require("auraluvsu.telescope")
require("auraluvsu.undotree")
require("auraluvsu.autocmd")

vim.keymap.set('n', '<leader>tn', function()
  require('auraluvsu.note').toggle_note()
end, { desc = 'Toggle floating notes' })

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls@3.15.0",
        "ts_ls",
        "gopls",
        "clangd",
        "jsonls",
        "rust_analyzer"
    },
    automatic_installation = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
