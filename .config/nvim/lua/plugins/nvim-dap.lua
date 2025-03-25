return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      local nvim_tree_view = require "nvim-tree.view"
      local nvim_tree_api = require "nvim-tree.api"

      local visible = false

      local function open()
        visible = nvim_tree_view.is_visible()
        if visible then
          nvim_tree_api.tree.close()
        end
        dapui.open()
      end

      local function close()
        local current_buf = vim.api.nvim_get_current_buf()

        vim.api.nvim_echo({ { "Press any key to close debugger...", "Normal" } }, true, {})
        vim.fn.getchar()

        vim.api.nvim_out_write "\n"

        dapui.close()

        vim.api.nvim_set_current_buf(current_buf)

        if visible then
          nvim_tree_api.tree.open()
        end
      end

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        open()
      end
      dap.listeners.before.launch.dapui_config = function()
        open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",

    config = function()
      require "configs.debug.cs"

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    end,
  },

  {
    "folke/lazydev.nvim",
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-dap-ui" },
    library = { plugins = { "nvim-dap-ui" }, types = true },
  },
}
