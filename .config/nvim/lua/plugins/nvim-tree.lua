return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    dofile(vim.g.base46_cache .. "nvimtree")

    local nvtree = require "nvim-tree"
    local api = require "nvim-tree.api"

    -- Add custom mappings
    local function custom_on_attach(bufnr)
      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      api.config.mappings.default_on_attach(bufnr)
    end

    local function custom_sorter(nodes)
      -- Define priority for specific directories
      local dir_priority = { bin = 1, obj = 2, Core = 3, Shared = 4 }

      -- Function to determine the sort value of a node
      local function get_sort_value(node)
        if node.type == "directory" then
          return dir_priority[node.name] or 5, node.name:lower()
        elseif node.name:match "%.cs$" then
          return 6, node.name:lower()
        else
          return 7, node.name:lower()
        end
      end

      -- Sort nodes based on the defined criteria
      table.sort(nodes, function(a, b)
        local a_val, a_name = get_sort_value(a)
        local b_val, b_name = get_sort_value(b)
        if a_val == b_val then
          return a_name < b_name
        else
          return a_val < b_val
        end
      end)
    end

    -- Automatically open file upon creation
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

    nvtree.setup {
      on_attach = custom_on_attach,
      sync_root_with_cwd = true,
      -- hijack_unnamed_buffer_when_opening = false,
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      filters = {
        custom = { "^.git$" },
      },
      git = {
        enable = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        highlight_git = "none",
        icons = {
          glyphs = {
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
            },
          },
        },
      },
      view = {
        width = 30,
        side = "left",
        signcolumn = "no",
      },
      filesystem_watchers = {
        ignore_dirs = { "bin", "obj", "node_modules" },
      },
      sort = {
        sorter = custom_sorter,
      },
    }
  end,
}
