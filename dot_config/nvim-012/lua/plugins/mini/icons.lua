vim.pack.add {
  {
    src = __.gh("nvim-mini/mini.icons"),
  },
}

require("mini.icons").mock_nvim_web_devicons()
require("mini.icons").tweak_lsp_kind()
