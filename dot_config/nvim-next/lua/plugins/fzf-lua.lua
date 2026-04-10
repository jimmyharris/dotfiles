# Requires webdev-icons or mini.icons
vim.pack.add({
  {
    src = __.gh('ibhagwan/fzf-lua')
  }
})

require("fzf-lua").setup {}
