return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen origin/master...HEAD<cr>", desc = "Diff vs master" },
      { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
    },
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    build = function()
      require("gitlab.server").build(true)
    end,
    event = "VeryLazy",
    config = function()
      require("gitlab").setup()
      local gitlab = require("gitlab")
      local map = function(key, fn, desc)
        vim.keymap.set("n", "<leader>m" .. key, fn, { desc = desc })
      end
      map("r", gitlab.review, "MR review")
      map("s", gitlab.summary, "MR summary")
      map("c", gitlab.create_comment, "MR comment")
      map("a", gitlab.approve, "MR approve")
      map("p", gitlab.pipeline, "MR pipeline")
      map("d", gitlab.toggle_discussions, "MR discussions")
      map("o", gitlab.choose_merge_request, "Pick MR")
    end,
  },
}
