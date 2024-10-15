local function get_csproj_name()
  local files = vim.fn.glob("*.csproj", false, true)
  if #files == 0 then
    error "No .csproj file found in the current directory"
  end
  -- Assuming there's only one .csproj file in the directory
  local csproj = vim.fn.fnamemodify(files[1], ":t:r")
  return csproj
end

local dap = require "dap" -- You should require dap here if it's globally needed

dap.adapters.coreclr = {
  type = "executable",
  command = "~/.local/share/nvim/mason/packages/netcoredbg/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
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
