-- XML support: no LazyVim extra exists, so wire up lemminx manually.
-- lemminx provides schema validation, completion, and formatting.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lemminx = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "xml" })
      end
    end,
  },
}
