require("lazyload").on_vim_enter(function()
  vim.pack.add {
    { src = "https://github.com/nvim-mini/mini.indentscope" },
  }

  local mini_indent = require("mini.indentscope")
  mini_indent.setup {
    draw = {
      animation = mini_indent.gen_animation.none(),
    },
    symbol = "▏",
  }
end)
