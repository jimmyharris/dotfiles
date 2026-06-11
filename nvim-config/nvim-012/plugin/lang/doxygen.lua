require("lazyload").on_vim_enter(function()
  -- support doxygen file detection.
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup("doxygen_doc_ftdetect", { clear=true }),
    pattern = { "*.doc"},
    command = "set filetype=doxygen"
  })
end)
