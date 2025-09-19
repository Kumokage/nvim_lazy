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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      providers = {
        smr = {
          prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
          prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

          get_url = function()
            return "https://ai.slb-ds.ru/v1/chat/completions"
          end,

          get_headers = function()
            local api_key = assert(os.getenv("OPENAI_API_KEY"), "OPENAI_API_KEY env var not set")
            return {
              Authorization = "Bearer " .. api_key,
              ["Content-Type"] = "application/json",
            }
          end,

          get_models = function(headers)
            local response, err = require("CopilotChat.utils").curl_get("https://ai.slb-ds.ru/v1/models", {
              headers = headers,
              json_response = true,
            })
            if err then
              error(err)
            end
            return vim
              .iter(response.body.data)
              :filter(function(model)
                local exclude_patterns = {
                  "audio",
                  "babbage",
                  "dall%-e",
                  "davinci",
                  "embedding",
                  "image",
                  "moderation",
                  "realtime",
                  "transcribe",
                  "tts",
                  "whisper",
                }
                for _, pattern in ipairs(exclude_patterns) do
                  if model.id:match(pattern) then
                    return false
                  end
                end
                return true
              end)
              :map(function(model)
                return {
                  id = model.id,
                  name = model.id,
                }
              end)
              :totable()
          end,
        },
      },
    },
  },
}
