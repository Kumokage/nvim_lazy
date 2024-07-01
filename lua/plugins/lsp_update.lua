return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" }
      keys[#keys + 1] = { "K", false }
    end,
  },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "https://github.com/aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
}
