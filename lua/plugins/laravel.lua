return {
  -- Laravel-aware tooling: artisan, routes, view/route navigation, etc.
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", "<cmd>Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", "<cmd>Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", "<cmd>Laravel related<cr>", desc = "Laravel Related" },
    },
    opts = {},
    config = true,
  },

  -- Blade template syntax highlighting + filetype detection.
  {
    "jwalton512/vim-blade",
    ft = "blade",
  },

  -- Blade formatting via conform (manual trigger only, since autoformat is off).
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
    },
  },
}
