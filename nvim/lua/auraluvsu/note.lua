local M = {}

local win_id = nil
local buf_id = nil
local filepath = "~/priv/notes.md" -- You can change this!

-- Function to toggle the notes window
function M.toggle_note()
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    M.save_to_file()
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
    buf_id = nil
  else
    M.open_note()
  end
end

-- Function to open the note window
function M.open_note()
  buf_id = vim.api.nvim_create_buf(false, true)

  -- Load file content if it exists
  local lines = {}
  local f = io.open(filepath, "r")
  if f then
    for line in f:lines() do
      table.insert(lines, line)
    end
    f:close()
  end
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)

  local width = 60
  local height = 8
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  win_id = vim.api.nvim_open_win(buf_id, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  })

  -- Optional: press <Esc> to close the note and save
  vim.keymap.set('n', '<Esc>', function()
    M.toggle_note()
  end, { buffer = buf_id })
end

-- Save buffer contents to file
function M.save_to_file()
  if not buf_id or not vim.api.nvim_buf_is_valid(buf_id) then return end

  local lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)
  local f = io.open(filepath, "w")
  if f then
    for _, line in ipairs(lines) do
      f:write(line .. "\n")
    end
    f:close()
  end
end

return M

