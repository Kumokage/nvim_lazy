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
    "obsidian-nvim/obsidian.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    ft = "markdown",
    cmd = "Obsidian",
    -- stylua: ignore
    keys = {
      { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "Open quick switch" },
      { "<leader>oO", "<cmd>Obsidian open<cr>", desc = "Open note in obsidian app" },
      { "<leader>of", "<cmd>Obsidian follow_link<cr>", desc = "Follow link" },
      { "<leader>odn", "<cmd>Obsidian today<cr>", desc = "Open today note" },
      { "<leader>odt", "<cmd>Obsidian tomorrow<cr>", desc = "Open tomorrow note" },
      { "<leader>ody", "<cmd>Obsidian yesterday<cr>", desc = "Open yesterday note" },
      { "<leader>otc", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox" },
      { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Open search in notes" },
      { "<leader>ots", "<cmd>Obsidian tags<cr>", desc = "Open search in tags" },
      { "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Rename note" },
      { "<leader>oc", "<cmd>Obsidian toc<cr>", desc = "Open table of content" },
      { "<leader>oit", "<cmd>Obsidian template<cr>", desc = "Open insert template" },
      { "<leader>ont", "<cmd>Obsidian new_from_template<cr>", desc = "New note from template" },
      { "<leader>obl", "<cmd>Obsidian backlinks<cr>", desc = "Search back links" },
      { "<leader>opi", "<cmd>Obsidian paste_img<cr>", desc = "Obsidian paste image" },
      { "<leader>oal", ":Obsidian link<cr>", mode = "v", desc = "Add link" },
      { "<leader>oln", ":Obsidian link_new<cr>", mode = "v", desc = "New link from visual" },
      { "<leader>oen", ":Obsidian extract_note<cr>", mode = "v", desc = "Extract text to new note" },
    },
    config = function()
      local obsidian_path = nil
      if string.find(string.lower(vim.uv.os_uname().release), "wsl") then
        obsidian_path = "/mnt/c/Users/AGlushko2/Zettelkasten"
      elseif string.find(string.lower(vim.uv.os_uname().sysname), "darwin") then
        obsidian_path = "/Users/alexglushko/Zettelkasten"
      end

      if obsidian_path ~= nil then
        require("obsidian").setup({
          legacy_commands = false,
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
          open = {
            -- keep the Obsidian app in the background (replaces open_app_foreground = false)
            func = function(uri)
              vim.ui.open(uri, { cmd = { "open", "-g" } })
            end,
          },
        })
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
    cmd = "Leet",
    -- also load when started as `nvim leetcode.nvim`
    lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
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
