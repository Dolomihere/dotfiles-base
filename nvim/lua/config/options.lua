local opt = vim.opt

-- Basic settings
opt.number = true -- Line number
opt.relativenumber = true -- Relative line number
opt.cursorline = true -- Highlight current cursor placement
opt.scrolloff = 10 -- Keep x line above/below when scrolling
opt.sidescrolloff = 8 -- Keep x columns characters on left
opt.wrap = false -- Don't wrap line
opt.cmdheight = 1 -- Status line height
opt.spelllang = { 'en' } -- Set language for spellchecking

-- Tab / Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- How many space act as a tab
opt.expandtab = true -- Use space instead of tab
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line then apply to new line
opt.grepprg = 'rg --vimgrep' -- Use ripgrep if available
opt.grepformat = '%f:%l:%c:%m' -- File name, line number, column, content

-- Search settings
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive if uppercase in search
opt.hlsearch = false -- Don't highlight search results
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
opt.termguicolors = true -- Use 24-bit colors ansi
opt.signcolumn = 'yes' -- Always show sign column
opt.colorcolumn = '100' -- Show column of x characters
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- How long to show matching bracket
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Completion menu options
opt.showmode = false -- Don't show mode in command line
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 0 -- Floating window transparency
opt.conceallevel = 0 -- Don't hide markup
opt.concealcursor = '' -- Show markup even on cursorline
opt.lazyredraw = false -- Redraw while exec macros
opt.redrawtime = 10000 -- Timeout for syntax highlight redraw
opt.maxmempattern = 20000 -- Max memory fpr pattern matching
opt.synmaxcol = 300 -- Syntax highlight column limit

-- File operations
opt.backup = false -- Don't create backup
opt.writebackup = false -- Don't back up before overwritting
opt.swapfile = false -- No swap files
opt.undofile = true -- Persistent undo
opt.updatetime = 300 -- Time to trigger CursorHold
opt.timeoutlen = 500 -- Time to wait for mapped sequence
opt.ttimeoutlen = 0 -- No wait for keycode sequences
opt.autoread = true -- Auto-reload file if changed outside
opt.autowrite = false -- Don't auto save on some events
opt.diffopt:append('vertical') -- Vertical diff splits
opt.diffopt:append('algorithm:patience') -- Better diff algorithm
opt.diffopt:append('linematch:60') -- Better diff highlighting (smart line matching)

-- Set undo directory and ensure it exists
local undodir = '/tmp/nvim/undodir' -- Undo directory path
opt.undodir = vim.fn.expand(undodir) -- Expand to full path
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, 'p') -- Create if not exists
end

-- Behavior Settings
opt.errorbells = false -- Disable error sounds
opt.backspace = 'indent,eol,start' -- Make backspace behave naturally
opt.autochdir = false -- Don't change directory automatically
opt.iskeyword:append('-') -- Treat dash as part of a word
opt.path:append('**') -- Search into subfolders with `gf`
opt.selection = 'inclusive' -- Use inclusive selection
opt.mouse = 'a' -- Enable mouse
opt.clipboard:append('unnamedplus') -- Use system clipboard
opt.modifiable = true -- Allow editing buffers
opt.encoding = 'UTF-8' -- Use UTF-8 encoding
opt.wildmenu = true -- Enable command-line completion menu
opt.wildmode = 'longest:full,full' -- Completion mode for command-line
opt.wildignorecase = true -- Case-insensitive tab completion in commands

-- Cursor Settings
opt.guicursor = {
  'n-v-c:block', -- Normal, Visual, Command-line
  'i-ci-ve:ver20', -- Insert, Command-line Insert, Visual-exclusive
  'r-cr:hor20', -- Replace, Command-line Replace
  'o:hor50', -- Operator-pending
  'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor', -- All modes: blinking & highlight groups
  'sm:block-blinkwait175-blinkoff150-blinkon175', -- Showmatch mode
}

-- Folding Settings
opt.foldmethod = 'expr' -- Use expression for folding
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folding
opt.foldlevel = 99 -- Keep all folds open by default

-- Split Behavior
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open to the right
