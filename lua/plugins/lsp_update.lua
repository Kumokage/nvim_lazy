return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "<leader>ch", vim.lsp.buf.hover, desc = "Hover" },
            { "K", false },
          },
        },
      },
    },
  },
  {
    "weirongxu/plantuml-previewer.vim",
    cmd = { "PlantumlOpen", "PlantumlToggle", "PlantumlStart", "PlantumlStop", "PlantumlSave" },
    dependencies = {
      "https://github.com/aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
}
