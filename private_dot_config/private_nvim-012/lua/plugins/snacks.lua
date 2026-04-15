vim.pack.add {
  {
    src = __.gh("folke/snacks.nvim"),
  },
}

require("snacks").setup {
  -- more beautiful vim.ui.input
  input = {
    enabled = true,
    win = {
      relative = "cursor",
      backdrop = true,
    },
  },
  -- more beautiful vim.ui.select
  picker = { enabled = true },
}
