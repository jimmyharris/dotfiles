local utils = require('utils')
require("lazyload").on_vim_enter(function()

  vim.pack.add {
    {
      src = "https://github.com/ngynkvn/gotmpl.nvim.git",
    },
  }

  local required_parsers = {
    "gotmpl",
  }

  for _, lang in ipairs(required_parsers) do
    utils.ts_install_once(lang)
  end

  require("gotmpl").setup()

end)
