return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  branch = 'main',
  opts = {
    auto_install = false,
    ensure_installed = {
      'bash', 'json', 'jsonc', 'vim', 'vimdoc', 'lua', 'query', 'markdown', 'markdown_inline',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true
    local install = require('nvim-treesitter.install')
  end,
}
