return {
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("overseer").setup {
        templates = { "builtin", "easy-dotnet.dap-task" },
      }
    end,
  },
}
