return {
  "jacksonludwig/vim-earl-grey",
  lazy = false,
  priority = 1000,
  config = function()
    if vim.env.TERM == "linux" then
      return
    end
    vim.cmd('colorscheme vim-earl-grey')
  end
}
