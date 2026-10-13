-- origin/HEAD points at the remote default branch (main or master)
local function diff_vs_default_branch()
  local ref = vim.trim(vim.fn.system({ "git", "rev-parse", "--abbrev-ref", "origin/HEAD" }))
  if vim.v.shell_error ~= 0 or ref == "" then
    ref = "origin/master"
  end
  vim.cmd("DiffviewOpen " .. ref .. "...HEAD")
end

return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gv", diff_vs_default_branch, desc = "Diff vs default branch" },
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
