--- Lua initialized configurtion
vim.loader.enable()

local __ = require("core")

local expected_version = "0.12.1"
__.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

require("globals")

require("options")

require("ui")

require("plugins")

require("lsp_conf")

require("diagnostic-conf")

require("mappings")
