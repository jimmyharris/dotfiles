require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/cespare/vim-toml",
      version = "main",
    },
  }
end)

