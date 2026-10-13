return {
  {
    "kaiiserni/pinescript.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = "pine",
    -- Плагин сам ставит ftdetect, но lazy-загрузка по `ft = "pine"` требует,
    -- чтобы filetype был известен ДО загрузки плагина — задаём его сами.
    init = function()
      vim.filetype.add({
        extension = {
          pine = "pine",
          pinescript = "pine",
        },
      })
    end,
    opts = {
      lsp = {
        enabled = true,
        auto_install = true, -- собирает Rust LSP через cargo при первом запуске
      },
      treesitter = {
        enabled = true,
        auto_install = true, -- компилирует tree-sitter парсер при первом запуске
      },
    },
  },
}
