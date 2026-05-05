require("lazyload").on_vim_enter(function()
  vim.g.canola_git = {
    show = { untracked = true, ignored = true },
    format = 'compact', -- 'compact' | 'symbol' | 'porcelain'
  }
  vim.g.canola = {
    columns = { "git_status", "icon", "permission", "size", "mtime" },
    cursor = true,
    hidden = {
      enabled = true,
    },
    watch = true,
  }
  vim.pack.add {
    {
      src = "https://github.com/barrettruth/canola.nvim",
      version = "canola"
    },
    {
      src = "https://github.com/barrettruth/canola-collection"
    }
  }

  vim.keymap.set("n", "-", "<CMD>Canola<CR>", { desc = "Open parent directory" })

  -- require("oil").setup {
  --   columns = {
  --     "icon",
  --     "permission",
  --     "size",
  --     "mtime",
  --   },
  --   watch_for_changes = true,
  --   show_hidden = true,
  -- }
end)
