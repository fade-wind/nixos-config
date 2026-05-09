local opt = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Performance and Timing
opt.updatetime = 100
opt.lazyredraw = false
opt.synmaxcol = 240
opt.timeoutlen = 500

-- UI & Appearance
-- Enable relative line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.showmatch = true
opt.matchtime = 1
opt.termguicolors = true
opt.winborder = "rounded"

-- Windows & Splits
opt.splitbelow = true
opt.splitright = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Files and Buffers
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.autoread = true
opt.fileencoding = "utf-8"
opt.modeline = true
opt.modelines = 100

-- Indents and Formatting
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
-- opt.smartindent = true
opt.breakindent = true
opt.preserveindent = true
opt.linebreak = true
opt.wrap = true

-- Completion and Popup
opt.pumheight = 10
opt.infercase = true
opt.completeopt = "menuone,noinsert,noselect"

-- Command Line and Message
opt.cmdheight = 0
opt.history = 100
opt.report = 9001

-- Editor Behavior
opt.virtualedit = "block"
opt.startofline = true
opt.title = true

opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

opt.scrolloff = 8
opt.mouse = "a"

opt.encoding = "utf-8"

opt.modifiable = true

opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, Command-line
	"i-ci-ve:block", -- Insert, Command-line Insert, Visual-exclusive
	"r-cr:hor20", -- Replace, Command-line Replace
	"o:hor50", -- Operator-pending
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch mode
}
