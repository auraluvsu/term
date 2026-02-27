-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Show cursorline only in active window
-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
--   group = augroup,
--   callback = function()
--     local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
--     if ok and cl then
--       vim.wo.cursorline = true
--       vim.api.nvim_win_del_var(0, "auto-cursorline")
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
--   group = augroup,
--   callback = function()
--     local cl = vim.wo.cursorline
--     if cl then
--       vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
--       vim.wo.cursorline = false
--     end
--   end,
-- })

-- LSP Info
vim.api.nvim_create_user_command("LspInfo", function()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients == 0 then
    print "No LSP clients attached to current buffer"
  else
    for _, client in ipairs(clients) do
      print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = "Show LSP client info" })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = augroup,
  callback = function(args)
    if vim.bo[args.buf].filetype == "nvim-pack" then
      return
    end

    local clients = vim.lsp.get_clients { bufnr = args.buf }
    for _, client in ipairs(clients) do
      if client:supports_method("textDocument/documentHighlight", args.buf) then
        vim.lsp.buf.document_highlight()
      end
    end
  end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  group = augroup,
  callback = vim.lsp.buf.clear_references,
})
