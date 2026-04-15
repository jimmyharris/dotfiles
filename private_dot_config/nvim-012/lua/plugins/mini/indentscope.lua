vim.pack.add {
  {
    src = __.gh("nvim-mini/mini.indentscope"),
  },
}

local mini_indent = require("mini.indentscope")
mini_indent.setup {
  draw = {
    animation = mini_indent.gen_animation.none(),
  },
  symbol = "▏",
}
