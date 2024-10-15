return {
  {
    "kaiwalter/azure-functions.nvim",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("azure-functions").setup {
        compress_log = true,
      }
    end,
  },
}
