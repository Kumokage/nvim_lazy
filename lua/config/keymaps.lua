local nvim_tmux_nav = require("nvim-tmux-navigation")
local map = LazyVim.safe_keymap_set

map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

map("i", "<C-c>", "<Esc>")
map("n", "<leader>wt", function()
  vim.fn.system({ "tmux", "split-window", "-v", "nvim " .. vim.fn.shellescape(vim.fn.expand("<cfile>")) })
end, { desc = "Open file under cursor in tmux split" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>J", "mzJ`z", { desc = "Merge line below" })
map("n", "K", "5k")
map("n", "J", "5j")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
-- map("x", "<leader>p", [["_dP]])

local wk = require("which-key")
wk.add({ { "<leader>o", group = "obsidian" } })
