require("lazyload").on_vim_enter(function()
  -- Load which-key

  vim.pack.add {
    {
      src = "https://github.com/folke/which-key.nvim",
    },
  }

  local which_key = require("which-key")

  -- Settings
  which_key.setup {
    preset = "modern",
    icons = {
      mappings = false,
    },
  }

  local keymap = vim.keymap

  keymap.set("n", "<leader>?", function()
    which_key.show { global = false }
  end, {
    silent = true,
    desc = "Buffer local keymaps (which-key)",
  })
end)
