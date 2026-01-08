-- Remove global default nvim lsp diagnostic key mapping and add new keymap for lsp diagnostic
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gO')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic error" })

-- Enable a lsp server
vim.lsp.enable({
  "bashls",
  "cssls",
  "emmet_language_server",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
  "svelte"
})

-- Custom toggleable inline lsp diagnostic
local diagnostics_active = true
vim.keymap.set('n', '<leader>di', function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable(true)
    print("LSP Errors: ON")
  else
    vim.diagnostic.enable(false)
    print("LSP Errors: OFF")
  end
end, { desc = "Toggle LSP Diagnostics" })

vim.diagnostic.config({
  virtual_lines = true,
  --virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
