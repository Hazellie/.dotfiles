return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "go",
        "javascript",
        "typescript",
        "sql",
        "json",
        "python",
        "toml",
        "xml",
        "http",
        "graphql",
        "jsdoc",
        "c_sharp",
      },
    },
  },
}
