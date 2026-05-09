return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      {
        "seblj/roslyn.nvim",
        ft = "cs",
        event = "VeryLazy",
      },
    },
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
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
      require("easy-dotnet").setup({
        lsp = {
          enabled = false,
          roslynator_enabled = false,
          analyzer_assemblies = {},
          config = {},
        },
        auto_bootstrap_namespace = {
          enabled = false,
        },
      })
    end,
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("nvim-tree").setup({
  --       view = {
  --         width = 50,
  --         side = "right",
  --       },
  --     })
  --   end,
  -- },
  --
  -- {
  --   dir = "~/projects/neovim/csharp-explorer.nvim",
  --   name = "csharp-explorer.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("csharp-explorer").setup({})
  --   end,
  -- },
}
