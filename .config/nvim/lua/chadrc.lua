-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "prettierd",
    "typescript-language-server",
    "gopls",
    "sqlls",
    "sqlfluff",
    "json-lsp",
    "jq",
    "jsonlint",
    "ruff",
    "taplo",
    "csharp-language-server",
    "csharpier",
    "netcoredbg",
  },
}

return M
