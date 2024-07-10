require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>rr","<cmd>Rest run<cr>",  { desc = "Run request under the cursor"})
map("n", "<leader>rl", "<cmd>Rest run last<cr>", { desc ="Re-run latest request" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
