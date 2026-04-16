require("lazyload").on_vim_enter(function()
  local keymap = vim.keymap
  local api = vim.api

  vim.pack.add {
    {
      src = "https://github.com/tpope/vim-fugitive",
    },
  }
  keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git: show status" })
  keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git: add file" })
  keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git: commit changes" })
  keymap.set("n", "<leader>gpl", "<cmd>Git pull<cr>", { desc = "Git: pull changes" })
  keymap.set("n", "<leader>gpu", "<cmd>15 split|term git push<cr>", { desc = "Git: push changes" })
  keymap.set("v", "<leader>gb", ":Git blame<cr>", { desc = "Git: blame selected line" })

  -- convert git to Git in command line mode
  vim.fn["utils#Cabbrev"]("git", "Git")

  keymap.set("n", "<leader>gbn", function()
    vim.ui.input({ prompt = "Enter a new branch name" }, function(user_input)
      if user_input == nil or user_input == "" then
        return
      end

      local cmd_str = string.format("G checkout -b %s", user_input)
      vim.cmd(cmd_str)
    end)
  end, {
    desc = "Git: create new branch",
  })

  keymap.set("n", "<leader>gf", ":Git fetch ", { desc = "Git: prune branches" })
  keymap.set("n", "<leader>gbd", ":Git branch -D ", { desc = "Git: delete _branch_" })

  api.nvim_create_augroup("fugitive_custom_config", { clear = true })

  api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    desc = "auto close fugitive buffers",
    group = "fugitive_custom_config",
    callback = function(ctx)
      vim.o.bufhidden = "delete"
    end,
  })
end)
