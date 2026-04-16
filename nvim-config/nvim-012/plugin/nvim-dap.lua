require("lazyload").on_vim_enter(function()
  vim.pack.add({
    {
      src = "https://github.com/mfussenegger/nvim-dap",
    },
    {
      src = "https://github.com/mfussenegger/nvim-dap-python"
    }
  })
end)
