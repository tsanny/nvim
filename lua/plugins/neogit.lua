return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
  },
  keys = {
    {
      "<leader>gn",
      function()
        local current_file = vim.fn.expand("%:p:h")
        local git_root = vim.fn.system("cd " .. vim.fn.shellescape(current_file) .. " && git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
        if git_root ~= "" and vim.fn.isdirectory(git_root) == 1 then
          require("neogit").open({ cwd = git_root })
        else
          require("neogit").open()
        end
      end,
      desc = "Neogit",
    },
  },
  config = function()
    require("neogit").setup({})
  end,
}
