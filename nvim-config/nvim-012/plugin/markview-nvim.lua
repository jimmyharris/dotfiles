
require("lazyload").on_vim_enter(function()
  vim.pack.add {
    { src = "https://github.com/OXY2DEV/markview.nvim" },
  }

  require("markview").setup {
    preview = {
      enable = false,
    },
  }
  -- disable preview for already open buffers.
  require("markview").commands.Disable()

  vim.api.nvim_set_keymap("n", "<leader>sv", "<CMD>Markview Toggle<CR>", {
    desc = "Toggles Markview `preview` for current buffer."
  })
end)
