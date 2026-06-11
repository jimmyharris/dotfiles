require("lazyload").on_vim_enter(function()
  -- Automatically assign terraform file types correctly.

  local terraform_ft = vim.api.nvim_create_augroup("terraform_ft", { clear=true })

  -- For terraform hcl files
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = terraform_ft,
    pattern = {
      "*.hcl",
      ".terraformrc",
      "terraform.rc",
    },
    command = "set filetype=hcl"
  })
  -- for tfvars:
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = terraform_ft,
    pattern = {
      "*.tfvars",
    },
    command = "set filetype=terraform",
  })
  -- for tfvars:
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = terraform_ft,
    pattern = {
      "*.tfstate",
      "*.tfstate.backup",
    },
    command = "set filetype=json",
  })
end)
