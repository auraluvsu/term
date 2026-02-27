local o = vim.opt
o.guicursor = ""
o.termguicolors = true -- Enable 24-bit colors
o.showmatch = true -- Highlight matching brackets
o.nu = true
o.lazyredraw = true -- Don't redraw during macros
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.wrap = true
o.hlsearch = false
o.incsearch = true
o.inccommand = "split" -- shows the effects of substitution
o.backup = false -- Dont' create backup files
o.writebackup = false -- Don't create backup before writing
o.swapfile = false -- Don't create swap files
o.undofile = true -- Persistent undo
o.mouse = "" -- Disable mouse
o.clipboard:append "unnamedplus" -- Use system clipboard
o.scrolloff = 10
o.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
o.updatetime = 20
o.diffopt:append "linematch:60"
o.redrawtime = 10000
o.maxmempattern = 20000

o.ignorecase = true -- Case insensitive search
o.smartcase = true -- Case sensitive if uppercase in search
o.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
