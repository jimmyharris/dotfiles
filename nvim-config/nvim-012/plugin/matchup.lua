require("lazyload").on_vim_enter(function()
  vim.pack.add {
    { src = "https://github.com/andymass/vim-matchup" },
  }

  require("match-up").setup {}
end)
