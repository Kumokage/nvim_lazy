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
  {
    "epwalsh/obsidian.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local obsidian_path = Nil
      if string.find(string.lower(vim.loop.os_uname().release), "wsl") then
        obsidian_path = "/mnt/c/Users/AGlushko2/Zettelkasten"
      elseif string.find(string.lower(vim.loop.os_uname().sysname), "darwin") then
        obsidian_path = "/Users/alexglushko/Zettelkasten"
      end

      if obsidian_path ~= Nil then
        require("obsidian").setup({
          mappings = {},
          workspaces = {
            {
              name = "personal",
              path = obsidian_path,
            },
          },
          daily_notes = {
            folder = "06 - Daily",
            date_format = "%Y-%m-%d",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "Daily note.md",
          },
          note_id_func = function(title)
            return title
          end,
          templates = {
            subdir = "99 - META/Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
          },
          open_app_foreground = false,
        })

        vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { desc = "Open quick switch" })
        vim.keymap.set("n", "<leader>oO", ":ObsidianOpen<CR>", { desc = "Open note in obsidian app" })
        vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Follow link" })

        vim.keymap.set("n", "<leader>odn", ":ObsidianToday<CR>", { desc = "Open today note" })
        vim.keymap.set("n", "<leader>odt", ":ObsidianTomorrow<CR>", { desc = "Open tomorrow note" })
        vim.keymap.set("n", "<leader>ody", ":ObsidianYesterday<CR>", { desc = "Open yestardayt note" })

        vim.keymap.set("n", "<leader>otc", ":ObsidianToggleCheckbox<CR>", { desc = "Toggle checkbox" })

        vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Open search in notes" })
        vim.keymap.set("n", "<leader>ots", ":ObsidianTags<CR>", { desc = "Open search in tags" })

        vim.keymap.set("n", "<leader>or", ":ObsidianRename<CR>", { desc = "Rename note" })
        vim.keymap.set("n", "<leader>oc", ":ObsidianTOC<CR>", { desc = "Open table of content" })

        vim.keymap.set("n", "<leader>oit", ":ObsidianTemplate<CR>", { desc = "Open insert template" })
        vim.keymap.set("n", "<leader>ont", ":ObsidianNewFromTemplate<CR>", { desc = "New note from template" })
        vim.keymap.set("n", "<leader>obl", ":ObsidianBacklinks<CR>", { desc = "Search back links" })

        vim.keymap.set("n", "<leader>opi", ":ObsidianPasteImg<CR>", { desc = "Obsidian paste image" })

        vim.keymap.set("v", "<leader>oal", ":ObsidianLink<CR>", { desc = "Add link" })
        vim.keymap.set("v", "<leader>oln", ":ObsidianLinkNew<CR>", { desc = "New link from visual" })
        vim.keymap.set("v", "<leader>oen", ":ObsidianExtractNote<CR>", { desc = "Extract text to new note" })
        vim.opt.conceallevel = 1
      end
    end,
  },
  {
    "ivanesmantovich/xkbswitch.nvim",
    config = function()
      require("xkbswitch").setup()
    end,
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
