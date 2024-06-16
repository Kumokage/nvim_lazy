return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" }
    end,
  },
}
