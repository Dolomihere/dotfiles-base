-- Func to set key map
local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Center screen when jumping
map('n', 'n', 'nzzzv', 'Next search result (centered)')
map('n', 'N', 'Nzzzv', 'Previous search result (centered)')
map('n', '<C-d>', '<C-d>zz', 'Half page down (centered)')
map('n', '<C-u>', '<C-u>zz', 'Half page up (centered)')

-- Buffer navigation
map('n', '<leader>bn', '<Cmd>bnext<CR>', 'Next buffer')
map('n', '<leader>bp', '<Cmd>bprevious<CR>', 'Previous buffer')

-- Better window navigation
map('n', '<C-h>', '<C-w>h', 'Move to left window')
map('n', '<C-j>', '<C-w>j', 'Move to bottom window')
map('n', '<C-k>', '<C-w>k', 'Move to top window')
map('n', '<C-l>', '<C-w>l', 'Move to right window')
map('n', '<leader>c', '<Cmd>close<CR>', 'Close current window')

-- Splitting & Resizing
map('n', '<leader>sv', '<Cmd>vsplit<CR>', 'Split window vertically')
map('n', '<leader>sh', '<Cmd>split<CR>', 'Split window horizontally')
map('n', '<C-Up>', '<Cmd>resize +2<CR>', 'Increase window height')
map('n', '<C-Down>', '<Cmd>resize -2<CR>', 'Decrease window height')
map('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', 'Decrease window width')
map('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', 'Increase window width')

-- Better indenting in visual mode
map('v', '<', '<gv', 'Indent left and reselect')
map('v', '>', '>gv', 'Indent right and reselect')

-- Better J behavior
map('n', 'J', 'mzJ`z', 'Join lines and keep cursor position')

-- For nvim :term
map('t', '<Esc>', [[<C-\><C-n>]], 'Exit terminal')
map('t', '<C-h>', [[<C-\><C-n><C-w>h]], 'Move to left window')
map('t', '<C-j>', [[<C-\><C-n><C-w>j]], 'Move to bottom window')
map('t', '<C-k>', [[<C-\><C-n><C-w>k]], 'Move to top window')
map('t', '<C-l>', [[<C-\><C-n><C-w>l]], 'Move to right window')
