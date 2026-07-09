return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        -- Remove the clock (LazyVim puts os.date in lualine_z).
        lualine_z = {},
      },
    },
  },
}
