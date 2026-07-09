-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable format-on-save globally. Formatting only runs on explicit <leader>cf.
-- This also disables eslint's fix-on-save (registered as a LazyVim formatter),
-- while keeping eslint diagnostics active.
vim.g.autoformat = false

-- .env files: no dotenv LSP exists, so just give them sensible highlighting.
-- Completion falls back to the existing cmp buffer source.
vim.filetype.add({
  filename = { [".env"] = "sh" },
  pattern = {
    -- .env.local, .env.production, etc.
    ["%.env%.[%w_.-]+"] = "sh",
    -- dev.env, prod.env, staging.env, and any *.env
    ["[%w_.-]*%.env"] = "sh",
  },
})
