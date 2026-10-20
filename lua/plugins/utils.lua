local uname = vim.uv.os_uname()
local is_mac = uname.sysname:lower():find("darwin") ~= nil

-- first existing vault wins; ~/Zettelkasten is a symlink to the Windows vault on WSL
local obsidian_path = nil
for _, path in ipairs({ "~/Zettelkasten", "/Users/alexglushko/Zettelkasten" }) do
  path = vim.fn.expand(path)
  if vim.fn.isdirectory(path) == 1 then
    obsidian_path = path
    break
  end
end

return {
  {
    "alexghergh/nvim-tmux-navigation",
  },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
      {
        "<leader>ru",
        function()
          require("undotree").toggle()
        end,
        desc = "Toggle undotree",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      table.insert(opts.spec, { "<leader>o", group = "obsidian" })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    cond = obsidian_path ~= nil,
    dependencies = "nvim-lua/plenary.nvim",
    ft = "markdown",
    cmd = "Obsidian",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.conceallevel = 1
        end,
      })
    end,
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
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "personal",
          path = obsidian_path,
        },
      },
      daily_notes = {
        folder = "06 - DAILY",
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
      -- on macOS keep the Obsidian app in the background; elsewhere (WSL) let vim.ui.open pick the opener
      open = is_mac and {
        func = function(uri)
          vim.ui.open(uri, { cmd = { "open", "-g" } })
        end,
      } or nil,
    },
  },
  {
    "ivanesmantovich/xkbswitch.nvim",
    config = function()
      require("xkbswitch").setup()
    end,
  },
}
