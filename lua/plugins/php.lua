-- Force phpactor as the PHP language server (deterministic regardless of the
-- lang.php extra's default), and make sure intelephense is not used.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {},
        intelephense = { enabled = false },
      },
    },
  },
}
