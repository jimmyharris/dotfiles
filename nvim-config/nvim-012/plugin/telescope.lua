require("lazyload").on_vim_enter(function()
  vim.pack.add {
    {
      src = "https://github.com/nvim-lua/plenary.nvim",
    },
    {
      src = "https://github.com/nvim-telescope/telescope.nvim",
    },
    {
      src = "https://github.com/nvim-telescope/telescope-symbols.nvim",
    },
    {
      src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
    },
    {
      src = "https://github.com/linux-cultist/venv-selector.nvim",
    },
  }

  local telescope = require("telescope")
  local keymap = vim.keymap

  telescope.load_extension("live_grep_args")

  local tele_builtin = require("telescope.builtin")

  keymap.set("n", "<leader>ff", tele_builtin.find_files, { desc = "Telescope find files" })

  keymap.set(
    "n",
    "<leader>fg",
    telescope.extensions.live_grep_args.live_grep_args,
    { desc = "Telescope live grep" }
  )

  keymap.set("n", "<leader>fh", tele_builtin.help_tags, { desc = "Telescope help tags" })

  keymap.set(
    "n",
    "<leader>ft",
    tele_builtin.current_buffer_tags,
    { desc = "Telescope buffer tags" }
  )
  keymap.set("n", "<leader>fb", tele_builtin.buffers, { desc = "Telescope buffers" })

  keymap.set("n", "<leader>fr", tele_builtin.oldfiles, { desc = "Telescope buffers or files" })

  -- venv_selector configuration
  local venv_selector = require("venv-selector")

  venv_selector.setup {}
end)
