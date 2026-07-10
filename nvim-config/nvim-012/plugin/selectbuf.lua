require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/vim-scripts/genutils"
    },
    {
      src = "https://github.com/vim-scripts/SelectBuf"
    }
  }
end)
