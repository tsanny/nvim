return {
  -- One Light theme (same as the old nvim.bak config)
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "light",
      transparent = false,
    },
  },

  -- Tell LazyVim to use onedark as the active colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
