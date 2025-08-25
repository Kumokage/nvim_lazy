-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local dap = require("dap")

table.insert(dap.configurations.python, {
  type = "python",
  request = "attach",
  name = "attach to litstar in docker",
  connect = {
    host = "127.0.0.1",
    port = 5678,
  },
  mode = "remote",
  cwd = vim.fn.getcwd(),
  pathMappings = {
    { localRoot = vim.fn.getcwd(), remoteRoot = "/server" },
  },
  justMyCode = false,
})
