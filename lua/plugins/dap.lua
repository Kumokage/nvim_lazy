return {
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("debugpy-adapter")
      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "attach",
        name = "attach to litestar in docker",
        connect = {
          host = "127.0.0.1",
          port = 5678,
        },
        mode = "remote",
        cwd = "${workspaceFolder}",
        pathMappings = {
          { localRoot = "${workspaceFolder}", remoteRoot = "/app" },
        },
        justMyCode = false,
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        print("Connected")
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}
