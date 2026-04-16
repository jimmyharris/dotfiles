local utils = require("utils")
require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/neovim/nvim-lspconfig",
    },
    {
      src = "https://github.com/mason-org/mason.nvim",
    },
    {
      src = "https://github.com/mason-org/mason-lspconfig.nvim",
    },
  }

  require("mason").setup()

  local npm_based_lsps = {
    "ansiblels",
    "bashls",
    "vimls",
    "yamlls",
  }

  local lsps = {
    "pyrefly",
    "ruff",
    "terraformls",
    "lua_ls",
  }

  if utils.executable("npm") then
    -- Lua can't handle table concatenation like python.
    for _, v in ipairs(npm_based_lsps) do
      table.insert(lsps, v)
    end
  else
    vim.notify(
      "Unable to find npm, will skip installing node based language servers.",
      vim.log.levels.WARN,
      { title = "Nvim-config" }
    )
  end

  require("mason-lspconfig").setup {
    ensure_installed = lsps,
  }
end)
