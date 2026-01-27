-- Remove global default nvim lsp diagnostic key mapping and add new keymap for lsp diagnostic
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gO')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic error' })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Lsp rename' })

-- Enable a lsp server
vim.lsp.enable({
  'bashls',
  'cssls',
  'emmet_language_server',
  'eslint',
  'html',
  'jsonls',
  'lua_ls',
  'tailwindcss',
  'ts_ls',
  'svelte'
})

-- Lsp diagnostic config
local diagnostic_presets = {
  errors_only = { vim.diagnostic.severity.ERROR },
  critical = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  info = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.INFO, vim.diagnostic.severity.HINT },
  all = {
    vim.diagnostic.severity.ERROR,
    vim.diagnostic.severity.WARN,
    vim.diagnostic.severity.INFO,
    vim.diagnostic.severity.HINT
  },

  -- Add more of your custom diagnostic preset here
}

local function apply_preset(levels)
  vim.diagnostic.config({

    -- Uncomment one of these for diagnostic underline or inline
    virtual_lines = { severity = levels },
    --virtual_text = { severity = levels },

    underline = { severity = levels },
    update_in_insert = false,
    severity_sort = true,

    float = {
      border = 'rounded',
      source = true,
    },

    signs = {
      severity = levels,
      text = {
        [vim.diagnostic.severity.ERROR] = '󰅚 ',
        [vim.diagnostic.severity.WARN] = '󰀪 ',
        [vim.diagnostic.severity.INFO] = '󰋽 ',
        [vim.diagnostic.severity.HINT] = '󰌶 ',
      },

      numhl = {
        [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        [vim.diagnostic.severity.WARN] = 'WarningMsg',
      },
    },
  })
end

vim.keymap.set('n', '<leader>de', function() apply_preset(diagnostic_presets.errors_only) end)
vim.keymap.set('n', '<leader>dc', function() apply_preset(diagnostic_presets.critical) end)
vim.keymap.set('n', '<leader>di', function() apply_preset(diagnostic_presets.info) end)
vim.keymap.set('n', '<leader>da', function() apply_preset(diagnostic_presets.all) end)
