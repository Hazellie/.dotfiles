return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      {
        "<leader>Ru",
        "<cmd>lua require('kulala.ui.auth_manager').open_auth_config()<cr>",
        desc = "Manage Auth Config",
        ft = "http",
      },
    },
  },
}
