return {
  "MagicDuck/grug-far.nvim",
  opts = {
    -- Include .env files in grep searches (even if in .gitignore)
    engines = {
      ripgrep = {
        extraArgs = "--max-count=999999 --no-ignore",
      },
    },
    -- Ensure .env files are searched even if in gitignore
    keymaps = {
      replace = "<leader>fr",
      qflist = "<leader>fq",
      syncLocations = "<leader>fs",
      syncLine = "<leader>fx",
      close = "<leader>fc",
      historyOpen = "<leader>fh",
      historyAdd = "<leader>fa",
      refresh = "<leader>ff",
      openLocation = "<leader>fo",
      gotoLocation = "<leader>fg",
      pickHistoryItem = "<leader>fp",
      abort = "<leader>fab",
      help = "<leader>f?",
    },
  },
}
