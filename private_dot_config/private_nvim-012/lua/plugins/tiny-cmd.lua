vim.o.cmdheight = 0
vim.pack.add {
  {
    src = __.gh("rachartier/tiny-cmdline.nvim"),
  },
}

require("tiny-cmdline").setup {
  -- Horizontal offset of the completion menu anchor from the window's left inner edge
  -- Used to align blink.cmp / nvim-cmp menus with the cmdline window
  menu_col_offset = 3,
}
