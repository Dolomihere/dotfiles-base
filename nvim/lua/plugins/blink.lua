return {
  'saghen/blink.cmp',
  dependencies = { 'saghen/blink.lib', 'rafamadriz/friendly-snippets' },
  version = '*',
  opts = {
    keymap = { preset = 'default' },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = "rust" }
  },
}
