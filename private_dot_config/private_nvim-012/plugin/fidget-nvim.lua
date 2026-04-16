require("lazyload").on_vim_enter(function()
  vim.pack.add {
    { src = "https://github.com/j-hui/fidget.nvim" },
  }
  local fidget = require("fidget")

  fidget.setup {}

  vim.notify = fidget.notify
end)
