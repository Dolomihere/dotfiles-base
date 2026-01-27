local key = vim.keymap

local opts = {
  noremap = true, -- non-recursive
  silent = true,  -- do not show message
}

-- Center screen when jumping
key.set('n', 'n', 'nzzzv', vim.tbl_extend('force', opts, { desc = 'Next search result (centered)' }))
key.set('n', 'N', 'Nzzzv', vim.tbl_extend('force', opts, { desc = 'Previous search result (centered)' }))
key.set('n', '<C-d>', '<C-d>zz', vim.tbl_extend('force', opts, { desc = 'Half page down (centered)' }))
key.set('n', '<C-u>', '<C-u>zz', vim.tbl_extend('force', opts, { desc = 'Half page up (centered)' }))

-- Buffer navigation
key.set('n', '<leader>bn', '<Cmd>bnext<CR>', vim.tbl_extend('force', opts, { desc = 'Next buffer' }))
key.set('n', '<leader>bp', '<Cmd>bprevious<CR>', vim.tbl_extend('force', opts, { desc = 'Previous buffer' }))

-- Better window navigation
key.set('n', '<C-h>', '<C-w>h', vim.tbl_extend('force', opts, { desc = 'Move to left window' }))
key.set('n', '<C-j>', '<C-w>j', vim.tbl_extend('force', opts, { desc = 'Move to bottom window' }))
key.set('n', '<C-k>', '<C-w>k', vim.tbl_extend('force', opts, { desc = 'Move to top window' }))
key.set('n', '<C-l>', '<C-w>l', vim.tbl_extend('force', opts, { desc = 'Move to right window' }))
key.set('n', '<leader>c', '<Cmd>close<CR>', vim.tbl_extend('force', opts, { desc = 'Close current window' }))

-- Splitting & Resizing
key.set('n', '<leader>sv', '<Cmd>vsplit<CR>', vim.tbl_extend('force', opts, { desc = 'Split window vertically' }))
key.set('n', '<leader>sh', '<Cmd>split<CR>', vim.tbl_extend('force', opts, { desc = 'Split window horizontally' }))
key.set('n', '<C-Up>', '<Cmd>resize +2<CR>', vim.tbl_extend('force', opts, { desc = 'Increase window height' }))
key.set('n', '<C-Down>', '<Cmd>resize -2<CR>', vim.tbl_extend('force', opts, { desc = 'Decrease window height' }))
key.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', vim.tbl_extend('force', opts, { desc = 'Decrease window width' }))
key.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', vim.tbl_extend('force', opts, { desc = 'Increase window width' }))

-- Better indenting in visual mode
key.set('v', '<', '<gv', vim.tbl_extend('force', opts, { desc = 'Indent left and reselect' }))
key.set('v', '>', '>gv', vim.tbl_extend('force', opts, { desc = 'Indent right and reselect' }))

-- Better J behavior
key.set('n', 'J', 'mzJ`z', vim.tbl_extend('force', opts, { desc = 'Join lines and keep cursor position' }))

-- Quick config editing
key.set('n', '<leader>l', function ()
  vim.cmd.e(vim.fn.stdpath('config') .. '/init.lua')
end, vim.tbl_extend('force', opts, { desc = 'Edit main config file init.lua' }))
