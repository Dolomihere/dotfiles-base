local cmd = vim.cmd
local opt = vim.opt
local indent = 2
local g = vim.g

g.mapleader = " "

cmd [[ filetype plugin indent on ]]

opt.backspace = { "eol", "start", "indent" }
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.encoding = "utf-8"
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.syntax = "enable"

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent
opt.shiftround = true

opt.showtabline = 2
opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" }
opt.wildmenu = true

opt.cursorline = true
opt.laststatus = 2
opt.lazyredraw = true
opt.list = true
opt.listchars = {
  tab = "┊ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×"
}

opt.cmdheight = 0

opt.mouse = "a"
opt.number = true
opt.scrolloff = 18
opt.sidescrolloff = 3
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.wrap = true

opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = false

opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess = opt.shortmess + { c = true, }

opt.showmode = false

opt.history = 100
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100

opt.termguicolors = true

opt.foldmethod = "marker"
opt.foldlevel = 99
