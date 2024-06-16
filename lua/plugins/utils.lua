return {
  {
    "alexghergh/nvim-tmux-navigation",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("undotree").setup()
    end,
    keys = {
      { "<leader>ru", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local obsidian_path = Nil
      if string.find(string.lower(vim.loop.os_uname().release), "wsl") then
        obsidian_path = "/home/aglushko2/Zettelkasten"
      elseif string.find(string.lower(vim.loop.os_uname().sysname), "darwin") then
        obsidian_path = "/Users/alexglushko/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten"
      end

      if obsidian_path ~= Nil then
        require("obsidian").setup({
          workspaces = {
            {
              name = "personal",
              path = obsidian_path,
            },
          },
          daily_notes = {
            folder = "Journal",
            date_format = "%Y-%m-%d",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "Daily note.md",
          },
          note_id_func = function(title)
            return title
          end,
          templates = {
            subdir = "Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
          },
          open_app_foreground = false,
        })

        vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>")
        vim.opt.conceallevel = 1
      end
    end,
  },
}
