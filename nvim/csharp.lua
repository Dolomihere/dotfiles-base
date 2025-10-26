local roslyn = require("roslyn")

roslyn.setup({
  config = {
    cmd = {
      "dotnet",
      vim.fn.expand("~/.dotnet/tools/Microsoft.CodeAnalysis.LanguageServer.dll"),
      "--logLevel", "Information",
      "--extensionLogDirectory", vim.fn.stdpath("state") .. "/roslyn",
    },
  },

  on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

