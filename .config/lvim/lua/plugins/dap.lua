return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    config = function()
      require("config.cs")

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    end,

    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        enabled = false,
      },

      {
        "miroshQa/debugmaster.nvim",
        dependencies = {
          {
            "nvim-lualine/lualine.nvim",
            event = "VeryLazy",
            config = function(_, opts)
              local dmode = false

              vim.api.nvim_create_autocmd("User", {
                pattern = "DebugModeChanged",
                callback = function(args)
                  dmode = args.data.enabled
                end,
              })

              for i, comp in ipairs(opts.sections.lualine_a) do
                if comp == "mode" or (type(comp) == "table" and comp[1] == "mode") then
                  opts.sections.lualine_a[i] = {
                    "mode",
                    separator = "",
                  }

                  table.insert(opts.sections.lualine_a, i + 1, {
                    function()
                      return dmode and "" or ""
                    end,
                    color = { fg = "#D54D6D" },
                    padding = { left = 0, right = 1 },
                    separator = "",
                  })

                  break
                end
              end

              -- local dmode = false
              -- local color = "#F38BA8"
              --
              -- vim.api.nvim_create_autocmd("User", {
              --   pattern = "DebugModeChanged",
              --   callback = function(args)
              --     dmode = args.data.enabled
              --   end,
              -- })
              --
              --
              --  --stylua: ignore
              -- local section_infos = {
              --   { "lualine_a", "mode", "bg", { fmt = function(str) return dmode and "DEBUG" or str end, separator = { right = "" } } },
              --   { "lualine_b", "branch", "fg", { } },
              --   { "lualine_y", "progress", "fg", { separator = " ", padding = { left = 1, right = 0 } } },
              --   { "lualine_y", "location", "fg", { padding = { left = 0, right = 1 } } },
              --   { "lualine_z", "function", "bg", { fmt = function() return " " .. os.date("%R") end,  } },
              -- }
              --
              -- for _, section_info in ipairs(section_infos) do
              --   local section, component, color_type, options = unpack(section_info)
              --
              --   for i, comp in ipairs(opts.sections[section]) do
              --     if
              --       comp == component
              --       or (type(comp) == "table" and comp[1] == component)
              --       or type(comp) == component
              --     then
              --       opts.sections[section][i] = {
              --         component,
              --         color = function()
              --           return dmode and { [color_type] = color }
              --         end,
              --         fmt = options.fmt,
              --         separator = options.separator,
              --         padding = options.padding,
              --       }
              --       break
              --     end
              --   end
              -- end

              require("lualine").setup(opts)
            end,
          },
        },
        event = "VeryLazy",
        config = function()
          local dm = require("debugmaster")
          vim.keymap.set({ "n", "t", "v" }, "<leader>dm", dm.mode.toggle, { desc = "Toggle Debug Mode", nowait = true })
        end,
      },

      {
        "igorlfs/nvim-dap-view",
        enabled = false,
        opts = {
          winbar = {
            show = true,
            -- You can add a "console" section to merge the terminal with the other views
            sections = { "watches", "exceptions", "breakpoints", "threads", "repl" },
            -- Must be one of the sections declared above
            default_section = "watches",
          },
          windows = {
            height = 12,
            terminal = {
              -- 'left'|'right'|'above'|'below': Terminal position in layout
              position = "left",
              -- List of debug adapters for which the terminal should be ALWAYS hidden
              hide = {},
              -- Hide the terminal when starting a new session
              start_hidden = false,
            },
          },
        },
        config = function(_, opts)
          local dap = require("dap")
          local dv = require("dap-view")

          dv.setup(opts)
          dap.listeners.before.attach["dap-view-config"] = function()
            dv.open()
          end
          dap.listeners.before.launch["dap-view-config"] = function()
            dv.open()
          end
          dap.listeners.before.event_terminated["dap-view-config"] = function()
            dv.close()
          end
          dap.listeners.before.event_exited["dap-view-config"] = function()
            dv.close()
          end
        end,
        keys = {
          {
            "<leader>dv",
            function()
              require("dap-view").toggle()
            end,
            desc = "Dap View",
          },
        },
      },
    },
  },
}
