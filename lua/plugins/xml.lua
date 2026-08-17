return {
  {
    "neovim/nvim-lspconfig",
    ft = "xml",
    opts = {
      servers = {
        lemminx = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ft = "xml",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "xml" })
      end
    end,
  },
}
