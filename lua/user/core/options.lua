local opt = vim.opt

-- Statusline
opt.laststatus = 3 -- global statusline
opt.showmode = false

-- Clipboard
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Toggle number
opt.relativenumber = true
opt.number = true

-- isfname
opt.isfname:append("@-@")

-- Tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Indent
opt.smartindent = true
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Term
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 100
opt.undofile = true

-- Scroll
opt.scrolloff = 10

-- Update time
opt.updatetime = 100

-- Swap file
opt.swapfile = false
