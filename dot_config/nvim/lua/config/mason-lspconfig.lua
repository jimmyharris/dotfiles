local utils = require("utils")

local npm_based_lsps = {
  "ansiblels",
  "bashls",
  "vimls",
  "yamlls"
}

local lsps = {
  "pyrefly",
  "ruff",
  "terraformls"
}

if utils.executable("npm") then
  lsps = lsps + npm_based_lsps
else
  vim.notify("Unable to find npm, will skip installing node based language servers.", vim.log.levels.WARN, { title = "Nvim-config" })
end

require("mason-lspconfig").setup({
      ensure_installed = lsps,
})
