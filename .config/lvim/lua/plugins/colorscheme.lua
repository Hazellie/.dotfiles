return {
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      no_italic = true,

      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },

      color_overrides = {
        all = {
          base = "#1E1D2D",
          mantle = "#191828",
          crust = "#252434",

          surface0 = "#2d2c3c",
          surface1 = "#363545",
          surface2 = "#3e3d4d",

          text = "#D9E0EE",
          subtext0 = "#474656",
          subtext1 = "#4e4d5d",
          overlay2 = "#555464",
          overlay1 = "#605f6f",

          -- line = "#383747",
          -- statusline_bg = "#232232",
          -- lightbg = "#2f2e3e",
          -- pmenu_bg = "#ABE9B3",
          -- folder_bg = "#89B4FA",

          red = "#F38BA8",
          -- baby_pink = "#ffa5c3",
          -- pink = "#F5C2E7",

          green = "#ABE9B3",
          -- vibrant_green = "#b6f4be",
          sapphire = "#8bc2f0",
          blue = "#89B4FA",
          yellow = "#FAE3B0",
          -- sun = "#ffe9b6",
          -- purple = "#d0a9e5",
          -- dark_purple = "#c7a0dc",
          teal = "#B5E8E0",
          -- orange = "#F8BD96",
          cyan = "#89DCEB",
          lavender = "#c7d1ff",
        },
      },
      highlight_overrides = {
        all = {
          ["@constructor"] = { fg = "#89DCEB" },

          ["@keyword"] = { fg = "#CBA6F7" },
          ["@keyword.coroutine"] = { fg = "#CBA6F7" },
          ["@keyword.function"] = { fg = "#CBA6F7" },
          ["@keyword.operator"] = { fg = "#CBA6F7" },
          ["@keyword.import"] = { fg = "#89B4FA" },
          ["@keyword.type"] = { fg = "#CBA6F7" },
          ["@keyword.modifier"] = { fg = "#CBA6F7" },
          ["@keyword.repeat"] = { fg = "#CBA6F7" },
          ["@keyword.return"] = { fg = "#CBA6F7" },
          ["@keyword.debug"] = { fg = "#CBA6F7" },
          ["@keyword.exception"] = { fg = "#F38BA8" },

          ["@keyword.conditional"] = { fg = "#CBA6F7" },
          ["@keyword.conditional.ternary"] = { fg = "#CBA6F7" },

          ["@keyword.directive"] = { fg = "#CBA6F7" },
          ["@keyword.directive.define"] = { fg = "#CBA6F7" },

          ["@module"] = { fg = "#F38BA8" },

          ["@variable"] = { fg = "#C7D1FF" },
          ["@variable.builtin"] = { fg = "#F38BA8" },
          ["@variable.member"] = { fg = "#F38BA8" },
          ["@variable.parameter"] = { fg = "#F38BA8" },
          ["@variable.parameter.builtin"] = { fg = "#F38BA8" },

          ["@property"] = { fg = "#B5E8E0" },

          ["@operator"] = { fg = "#BFC6D4" },

          ["@punctuation.delimiter"] = { fg = "#F38BA8" },
          ["@punctuation.bracket"] = { fg = "#F38BA8" },
          ["@punctuation.special"] = { fg = "#89DCEB" },
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
