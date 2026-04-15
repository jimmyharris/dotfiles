--- Lua initialized configurtion
vim.loader.enable()

local utils = require("utils")

local expected_version = "0.11.6"
utils.is_compatible_version(expected_version)

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

require("globals")

vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/options.vim"))

require("mappings")

vim.cmd("source " .. vim.fs.joinpath(config_dir, "viml/plugins.vim"))

-- diagnostic related config
require("diagnostic-conf")

require("colorschemes")
