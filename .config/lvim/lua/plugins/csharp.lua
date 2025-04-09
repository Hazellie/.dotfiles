return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "seblj/roslyn.nvim",
        ft = "cs",
        event = "VeryLazy",
        opts = {},
      },
    },
    opts = {
      ensure_installed = {
        "netcoredbg",
        "csharpier",
        "roslyn",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c_sharp",
      })
    end,
  },

  {
    "GustavEikaas/easy-dotnet.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup()
    end,
  },
}
