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
  -- Lua can't handle table concatenation like python.
  for _,v in ipairs(npm_based_lsps) do
    table.insert(lsps, v)
  end
else
  vim.notify("Unable to find npm, will skip installing node based language servers.", vim.log.levels.WARN, { title = "Nvim-config" })
end

require("mason-lspconfig").setup({
      ensure_installed = lsps,
})
