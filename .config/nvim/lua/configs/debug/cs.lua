--
-- local dap = require "dap" -- You should require dap here if it's globally needed
--
-- dap.adapters.coreclr = {
--   type = "executable",
--   command = "~/.local/share/nvim/mason/packages/netcoredbg/netcoredbg",
--   args = { "--interpreter=vscode" },
-- }
--
-- dap.configurations.cs = {
--   {
--     type = "coreclr",
--     name = "Attach to running Azure Function",
--     request = "attach",
--     processId = function()
--       -- Get the project name and use it to match the running dotnet process
--       local csproj_name = get_csproj_name()
--       return require("dap.utils").pick_process {
--         filter = function(proc)
--           return proc.name:match "dotnet" and proc.name:match(csproj_name .. ".dll")
--         end,
--       }
--     end,
--   },
-- }

local dap = require "dap"
local dotnet = require "easy-dotnet"

local function get_csproj_name()
  local files = vim.fn.glob("*.csproj", false, true)
  if #files == 0 then
    error "No .csproj file found in the current directory"
  end
  -- Assuming there's only one .csproj file in the directory
  local csproj = vim.fn.fnamemodify(files[1], ":t:r")
  return csproj
end

-- Rebuilds the project before starting the debug session
---@param co thread
local function rebuild_project(co, path)
  local spinner = require("easy-dotnet.ui-modules.spinner").new()
  spinner:start_spinner "Building"
  vim.fn.jobstart(string.format("dotnet build %s", path), {
    on_exit = function(_, return_code)
      if return_code == 0 then
        spinner:stop_spinner "Built successfully"
      else
        spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
        error "Build failed"
      end
      coroutine.resume(co)
    end,
  })
  coroutine.yield()
end

local debug_dll = nil
local function ensure_dll()
  if debug_dll ~= nil then
    return debug_dll
  end
  local dll = dotnet.get_debug_dll()
  debug_dll = dll
  return dll
end

if not dap.adapters["netcoredbg"] then
  dap.adapters["netcoredbg"] = {
    type = "executable",
    command = vim.fn.exepath "netcoredbg",
    args = { "--interpreter=vscode" },
  }
end

dap.configurations.cs = {
  {
    log_level = "DEBUG",
    type = "netcoredbg",
    justMyCode = false,
    exceptionBreakpoints = { "unhandled" },
    stopAtEntry = false,
    name = "Default",
    request = "launch",
    env = function()
      local dll = ensure_dll()
      local vars = dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
      return vars or nil
    end,
    program = function()
      local dll = ensure_dll()
      local co = coroutine.running()
      rebuild_project(co, dll.project_path)
      return dll.relative_dll_path
    end,
    cwd = function()
      local dll = ensure_dll()
      return dll.relative_project_path
    end,
  },
  {
    type = "coreclr",
    name = "Attach to running Azure Function",
    request = "attach",
    processId = function()
      -- Get the project name and use it to match the running dotnet process
      local csproj_name = get_csproj_name()
      return require("dap.utils").pick_process {
        filter = function(proc)
          return proc.name:match "dotnet" and proc.name:match(csproj_name .. ".dll")
        end,
      }
    end,
  },
}

dap.listeners.before["event_terminated"]["easy-dotnet"] = function()
  debug_dll = nil
end
