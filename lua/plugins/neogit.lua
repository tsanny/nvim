return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
  },
  lazy = true,
  keys = {
    {
      "<leader>gn",
      function()
        local root = vim.fs.root(0, ".git")
        require("neogit").open(root and { cwd = root } or {})
      end,
      desc = "Neogit",
    },
  },
  config = function()
    require("neogit").setup({})
  end,
}
