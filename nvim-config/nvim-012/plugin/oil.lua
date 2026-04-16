require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/stevearc/oil.nvim",
    },
  }

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

  require("oil").setup {
    columns = {
      "icon",
      "permission",
      "size",
      "mtime",
    },
    watch_for_changes = true,
    show_hidden = true,
  }
end)
