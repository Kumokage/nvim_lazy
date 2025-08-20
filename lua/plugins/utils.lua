return {
  {
    "alexghergh/nvim-tmux-navigation",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("undotree").setup()
      vim.keymap.set("n", "<leader>ru", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Toggle undotree" })
    end,
  },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   config = function()
  --     local obsidian_path = Nil
  --     if string.find(string.lower(vim.loop.os_uname().release), "wsl") then
  --       obsidian_path = "/mnt/c/Users/AGlushko2/Zettelkasten"
  --     elseif string.find(string.lower(vim.loop.os_uname().sysname), "darwin") then
  --       obsidian_path = "/Users/alexglushko/Zettelkasten"
  --     end
  --
  --     if obsidian_path ~= Nil then
  --       require("obsidian").setup({
  --         workspaces = {
  --           {
  --             name = "personal",
  --             path = obsidian_path,
  --           },
  --         },
  --         daily_notes = {
  --           folder = "06 - Daily",
  --           date_format = "%Y-%m-%d",
  --           -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
  --           template = "Daily note.md",
  --         },
  --         note_id_func = function(title)
  --           return title
  --         end,
  --         templates = {
  --           subdir = "99 - META/Templates",
  --           date_format = "%Y-%m-%d",
  --           time_format = "%H:%M",
  --           -- A map for custom variables, the key should be the variable and the value a function
  --           substitutions = {},
  --         },
  --         open_app_foreground = false,
  --       })
  --
  --       vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { desc = "Open quick switch" })
  --       vim.opt.conceallevel = 1
  --     end
  --   end,
  -- },
  {
    "lyokha/vim-xkbswitch",
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "python3",
    },
  },
}
