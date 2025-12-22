return {
  'seblyng/roslyn.nvim',
  opts = {
    enabled = true,
    ft = 'cs',
    config = function()
      vim.lsp.config('roslyn', {
        on_attach = function()
          print('This will run when the server attached!')
        end,
        settings = { },
      })

      local roslyn = require('roslyn');
      roslyn.setup();
    end
  },
}
