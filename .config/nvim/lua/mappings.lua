require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<F5>", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })
map("n", "<F12>", "<cmd> ZenMode <CR>", { desc = "Toggle zen mode" })

map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code action" })
map("n", "<leader>ra", require "nvchad.lsp.renamer", { desc = "LSP NvRenamer" })

map("n", "<leader>tt", "<cmd>XToggleTests <CR>", { desc = "Toggle test celect" })
map("n", "<leader>tl", "<cmd>XToggleLog <CR>", { desc = "Toggle test log" })
map("n", "<leader>tr", "<cmd>XRunTestMono <CR>", { desc = "Run test" })
map("n", "<leader>ta", "<cmd>XRunAllMono <CR>", { desc = "Run all tests" })

-- map(( "n", "i", "v" ), "<C-s>", "<cmd> w <cr>")
