require("lazyload").on_vim_enter(function()
  -- Requires webdev-icons or mini.icons
  vim.pack.add {
    {
      src = __.gh("ibhagwan/fzf-lua"),
    },
  }

  require("fzf-lua").setup {}
end)
