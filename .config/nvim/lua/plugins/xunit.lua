return {
  {
    "Hazellie/xunit.nvim",
    dir = "~/projects/neovim/xunit.nvim",
    event = "VeryLazy",
    config = function()
      require("xunit").setup()
    end,
  },
}
