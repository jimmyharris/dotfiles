require("lazyload").on_vim_enter(function()
  vim.o.cmdheight = 0
  vim.pack.add {
    {
      src = "https://github.com/rachartier/tiny-cmdline.nvim",
    },
  }

  require("tiny-cmdline").setup {
    -- Horizontal offset of the completion menu anchor from the window's left inner edge
    -- Used to align blink.cmp / nvim-cmp menus with the cmdline window
    menu_col_offset = 3,
  }
end)
