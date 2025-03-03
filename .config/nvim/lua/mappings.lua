require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
-- map("n", "<F5>", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })
map("n", "<F12>", "<cmd> ZenMode <CR>", { desc = "Toggle zen mode" })

map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code action" })
map("n", "<leader>ra", require "nvchad.lsp.renamer", { desc = "LSP NvRenamer" })

map("n", "<leader>tt", "<cmd>XToggleTests <CR>", { desc = "Toggle test celect" })
map("n", "<leader>tl", "<cmd>XToggleLog <CR>", { desc = "Toggle test log" })
map("n", "<leader>tr", "<cmd>XRunTestMono <CR>", { desc = "Run test" })
map("n", "<leader>ta", "<cmd>XRunAllMono <CR>", { desc = "Run all tests" })

map({ "n", "v" }, "<leader>q", "", { desc = "+database" })
map("n", "<leader>qt", "<cmd>DBUIToggle <CR>", { desc = "Toggle DBUI" })
map("n", "<leader>qf", "<cmd>DBUIFindBuffer <CR>", { desc = "Find in DBUI buffer" })
map("n", "<leader>qa", "<cmd>DBUIAddConnection <CR>", { desc = "Add DB connection" })

map({ "n", "v" }, "<leader>d", "", { desc = "+debug" })

map({ "n", "v" }, "<leader>dR", function()
  local dap = require "dap"
  local extension = vim.fn.expand "%:e"
  dap.run(dap.configurations[extension][1])
end, { desc = "Run default configuration" })

map({ "n", "v" }, "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Breakpoint Condition" })

map({ "n", "v" }, "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

map({ "n", "v" }, "<F5>", function()
  require("dap").continue()
end, { desc = "Continue" })

map({ "n", "v" }, "<leader>da", function()
  require("dap").continue { before = get_args }
end, { desc = "Run with Args" })

map({ "n", "v" }, "<leader>dC", function()
  require("dap").run_to_cursor()
end, { desc = "Run to Cursor" })

map({ "n", "v" }, "<leader>dg", function()
  require("dap").goto_()
end, { desc = "Go to Line (No Execute)" })

map({ "n", "v" }, "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })

map({ "n", "v" }, "<leader>dj", function()
  require("dap").down()
end, { desc = "Down" })

map({ "n", "v" }, "<leader>dk", function()
  require("dap").up()
end, { desc = "Up" })

map({ "n", "v" }, "<leader>dl", function()
  require("dap").run_last()
end, { desc = "Run Last" })

map({ "n", "v" }, "<leader>do", function()
  require("dap").step_out()
end, { desc = "Step Out" })

map({ "n", "v" }, "<leader>dO", function()
  require("dap").step_over()
end, { desc = "Step Over" })

map({ "n", "v" }, "<leader>dp", function()
  require("dap").pause()
end, { desc = "Pause" })

map({ "n", "v" }, "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })

map({ "n", "v" }, "<leader>ds", function()
  require("dap").session()
end, { desc = "Session" })

map({ "n", "v" }, "<leader>dt", function()
  require("dap").terminate()
end, { desc = "Terminate" })

map({ "n", "v" }, "<leader>dw", function()
  require("dap.ui.widgets").hover()
end, { desc = "Widgets" })

-- map(( "n", "i", "v" ), "<C-s>", "<cmd> w <cr>")
