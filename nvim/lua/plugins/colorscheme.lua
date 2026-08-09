return {
  'savq/melange-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    if vim.env.TERM == 'linux' then
      return
    end

    local colorscheme = 'melange'
    local is_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
    if not is_ok then
        vim.notify('colorscheme ' .. colorscheme .. ' not found!')
        return
    end
  end
}
