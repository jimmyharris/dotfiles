vim.pack.add({
  { src = __.gh("j-hui/fidget.nvim") }
})
local fidget = require("fidget")

fidget.setup {}

vim.notify = fidget.notify
