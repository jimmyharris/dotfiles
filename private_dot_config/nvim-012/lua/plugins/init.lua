--- Vim pack configuration
--

--- Core requirements:

vim.pack.add {
  {
    src = __.gh("nvim-lua/plenary.nvim"),
  },
}

--- We must require configurations and modules in load order.

require("plugins.nvim-treesitter")
require("plugins.mini.icons")
require("plugins.mini.indentscope")
require("plugins.lualine-conf")
require("plugins.nvim-tree")
require("plugins.fidget-nvim")
require("plugins.oil")
require("plugins.mason-lspconfig")
require("plugins.telescope")
require("plugins.fzf-lua")
require("plugins.nvim-cmp")
require("plugins.tiny-cmd")
require("plugins.fugitive")
require("plugins.which-key")
require("plugins.hlslens")
require("plugins.matchup")
require("plugins.autopairs")
require("plugins.nvim-ufo")
require("plugins.glance")
require("plugins.gitsigns")

--- Extra file types with no configuration
vim.pack.add {
  {
    src = __.gh("cespare/vim-toml"),
    version = "main",
  },
  {
    src = __.gh("tpope/vim-surround"),
  },
  {
    src = __.gh("tpope/vim-abolish"),
  },
  {
    src = __.gh("Bekaboo/dropbar.nvim"),
  },
}
