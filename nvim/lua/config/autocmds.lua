-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup('LastCursorGroup', {})
vim.api.nvim_create_autocmd('BufReadPost', {
  group = last_cursor_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight the yanked text
local highlight_yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_yank_group,
  pattern = '*',
  callback = function()
    vim.hl.on_yank()
  end,
})

--[[ Always insert when in terminal (Snacks.terminal replaced this)
local term_group = vim.api.nvim_create_augroup('terminal-settings', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter', 'TermOpen' }, {
  group = term_group,
  pattern = 'term://*',
  callback = function()
    vim.cmd('startinsert')
  end,
})
]]
