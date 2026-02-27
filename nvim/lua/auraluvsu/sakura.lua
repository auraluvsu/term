vim.cmd("colorscheme shado")

require('lualine').setup {
  options = {
    theme = 'shado'
  }
}

local highlights = {
    Normal = { bg = "none" },            -- Main editor background
    NormalFloat = { bg = "none" },       -- Floating windows (e.g., LSP hover)
    LineNr = { bg = "none" },            -- Line numbers background
    SignColumn = { bg = "none" },        -- Gutter (where git signs/diagnostics appear)
    EndOfBuffer = { bg = "none" },       -- Empty lines at bottom of file
    
    Comment = { fg = "#8d7643", italic = true }, -- Custom color for comments
    Visual = { bg = "none", fg = "#29c293" },                 -- Custom selection color
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
end
