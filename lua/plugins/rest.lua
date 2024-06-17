return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    build = ":TSInstall http",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("telescope").load_extension("rest")
      require("rest-nvim").setup({
        keybinds = {
          {
            "<localleader>rr",
            "<cmd>Rest run<cr>",
            "Run request under the cursor",
          },
          {
            "<localleader>rl",
            "<cmd>Rest run last<cr>",
            "Re-run latest request",
          },
          {
            "<localleader>rf",
            "<cmd>Telescope rest select_env<cr>",
            "Find request env",
          },
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        "rest",
        icon = "",
        fg = "#428890",
      })
    end,
  },
}
