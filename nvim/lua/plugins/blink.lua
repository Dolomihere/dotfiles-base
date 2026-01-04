return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip", "neovim/nvim-lspconfig" },
  version = '*',
  opts = {
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      preset = 'none', -- Disable presets if you want full manual control
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
    cmdline = {
      enabled = false, -- This disables completion in the command line (:) 
      completion = { menu = { auto_show = true } },
      keymap = {
          ["<CR>"] = { "accept_and_enter", "fallback" },
      },
    },
    completion = {
      menu = {
        border = "single",
        scrolloff = 1,
        scrollbar = false,
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false
        },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        window = {
          border = "single",
          scrollbar = false,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        },
        auto_show = true,
        auto_show_delay_ms = 500,
      },
    },
  }
}
