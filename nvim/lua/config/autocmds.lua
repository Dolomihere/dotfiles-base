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

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_yank_group,
  pattern = '*',
  callback = function()
    vim.hl.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end,
})

-- Auto run lsp setup
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- defaults:
    -- https://neovim.io/doc/user/news-0.11.html#_defaults

    map('gl', vim.diagnostic.open_float, 'Open Diagnostic Float')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gs', vim.lsp.buf.signature_help, 'Signature Documentation')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('<leader>la', vim.lsp.buf.code_action, 'Code Action')
    map('<leader>lr', vim.lsp.buf.rename, 'Rename all references')
    map('<leader>lf', vim.lsp.buf.format, 'Format')
    map('<leader>v', '<cmd>vsplit | lua vim.lsp.buf.definition()<cr>', 'Goto Definition in Vertical Split')

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      -- When cursor stops moving: Highlights all instances of the symbol under the cursor
      -- When cursor moves: Clears the highlighting
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      -- When LSP detaches: Clears the highlighting
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})

-- Change keymap of Netrw
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for Netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
    end

    bind('<C-h>', '<C-w>h')
    bind('<C-j>', '<C-w>j')
    bind('<C-k>', '<C-w>k')
    bind('<C-l>', '<C-w>l')
  end
})
