local set = vim.keymap.set
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.g.have_nerd_font = true
local function toggle_diffview()
-- Check if any Diffview buffers exist
for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype

    if ft == "DiffviewFiles" or ft == "DiffviewFileHistory" then
        vim.cmd("DiffviewClose")
        return
    end
end

-- If we get here, Diffview isn't open
vim.cmd("DiffviewOpen")
end

set('n', '<leader>tn', function()
  require('auraluvsu.note').toggle_note()
end, { desc = 'Toggle floating notes' })

set('n', 'gr', vim.lsp.buf.references, { desc = "Get all references" })
set("n", "<leader>pv", function()
    -- vim.cmd("cd ~/projects/")
    vim.cmd("Oil")
end, {})
set("n", "<leader>w", vim.cmd.bd)
set("n", "<leader>q", vim.cmd.x)
set("n", "<leader>od", vim.cmd.x)
set("n", "dv", toggle_diffview, { desc = "Diffview toggle"})
set("n", "ts", vim.cmd.Telescope)
set("n", "<leader>so", vim.cmd.so)
set("n", "<leader>vi", function()
    builtin.find_files { cwd = vim.fn.stdpath "config", prompt_title = "Config files 📁"}
end, {})
set("n", "<leader>ds", function()
    builtin.lsp_document_symbols()
end, {})
set('n', '<leader>pf', function()
    builtin.find_files {
        find_command = { "rg", "--ignore", "--hidden","--files", "--glob", "!.git" },
        prompt_title = "Fuzzy Finder 📁",
    }
end, {desc = "Find Files"})
set('n', '<leader>lg', function()
    builtin.live_grep({
        prompt_title = "Live Grep 🔥"
    })
end, {desc = "Grep"})
set('n', 'gd', vim.lsp.buf.definition, {})
set('n', 'gs', ":LazyGit<CR>", {})
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "<Tab>", "<C-u>zz")
set("n", "<Backspace>", "<C-d>zz")
set("v", "<Tab>", "<C-u>zz")
set("v", "<Backspace>", "<C-d>zz")
set("n", "n", "nzzzv")
set("n", "N", "nzzzv")
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

local arrow_keys = { "<up>", "<left>", "<down>", "<right>" }
  for _, key in ipairs(arrow_keys) do
      set("n", key, function()
          vim.notify("FUCK YOUUUUUUUUUUUUUUUUUUUUUUU", vim.log.levels.ERROR)
      end, {
      noremap = true,
      silent = true,
  })
end

set("n", "z=", function()
  local suggestions = vim.fn.spellsuggest(vim.fn.expand "<cword>", 20)
  if #suggestions == 0 then
    vim.cmd "normal! z="
    return
  end

  vim.ui.select(suggestions, {
    prompt = "Spelling suggestions",
  }, function(choice)
    if choice then
     vim.cmd("normal! ciw" .. choice)
    end
  end)
end, { desc = "Spell suggestions" })

-- Copy full path
set("n", "<leader>cp", function()
  local rel = vim.fn.expand "%:." -- path relative to cwd (pwd)
  if rel == "" then
    vim.notify("No file name for this buffer", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", rel) -- use "*" if you prefer primary selection
  vim.notify("copied: " .. rel)
end, { desc = "Copy relative file path" })
