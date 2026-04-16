--- Lua initialized configurtion
vim.loader.enable()

local utils = require("utils")

local expected_version = "0.12.1"
utils.is_compatible_version(expected_version)


require("globals")

require("options")

require("ui")

require("lsp_conf")

require("diagnostic-conf")

require("mappings")
