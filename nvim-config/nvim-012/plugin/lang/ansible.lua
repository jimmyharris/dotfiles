local utils = require('utils')
require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/pearofducks/ansible-vim",
    },
  }

  local required_parsers = {
    "jinja",
    "jinja_inline",
    "yaml"
  }

  for _, lang in ipairs(required_parsers) do
    utils.ts_install_once(lang)
  end

  require('ansible').setup()

  -- force ansiblels to load on ansible files.
  vim.lsp.config('ansiblels', {
    filetypes = { 'ansible' },
  })

  -- extend autogroup to support playbooks
  local ansible_ftyaml = vim.api.nvim_create_augroup("ansible_vim_ftyaml_ansible", { clear=false})

  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = ansible_ftyaml,
    pattern = { "*/playbooks/*.yml", "*/playbooks/*.yaml" },
    command = "set filetype=ansible"
  })

end)
