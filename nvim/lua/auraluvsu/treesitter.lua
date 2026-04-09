require("nvim-treesitter").install({ 'lua', 'go', 'typescript', 'python', 'rust', 'zig', 'javascript'}):wait(300000)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'typescript', 'javascript', 'rust' },
  callback = function() vim.treesitter.start() end,
})
