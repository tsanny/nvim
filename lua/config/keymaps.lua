-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Two-stage grep, like the old telescope `grep_string({ search = input })`:
-- prompt for the term ONCE, run a fixed ripgrep for it, then let the picker
-- prompt filter *within* those results by filename/path. LazyVim's <leader>sg
-- is live-grep instead -- every keystroke re-runs rg and the prompt can never
-- be used to narrow by filename. `live = false` is what flips that.
local function grep_prompt(cwd)
  return function()
    local ok, search = pcall(vim.fn.input, "Grep > ")
    if not ok or search == "" then
      return
    end
    Snacks.picker.grep({ search = search, live = false, cwd = cwd() })
  end
end

vim.keymap.set("n", "<leader>ps", grep_prompt(LazyVim.root), { desc = "Grep prompt (Root Dir)" })
vim.keymap.set("n", "<leader>pS", grep_prompt(vim.uv.cwd), { desc = "Grep prompt (cwd)" })

-- Alias pf to ff (find files, root dir)
vim.keymap.set("n", "<leader>pf", "<leader>ff", { remap = true, desc = "Find Files (Root Dir)" })

-- Alias pF to fF (find files, cwd)
vim.keymap.set("n", "<leader>pF", "<leader>fF", { remap = true, desc = "Find Files (cwd)" })

-- Remap Ctrl+C to Esc (triggers autocommands properly)
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true })

-- Double Esc to leave terminal mode. Snacks' own float already does this via a
-- 200ms timer, but plain `:terminal` buffers don't -- this covers both.
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })

-- Alias pt to ft (terminal, root dir)
vim.keymap.set("n", "<leader>pt", "<leader>ft", { remap = true, desc = "Terminal (Root Dir)" })

-- Alias pT to fT (terminal, cwd)
vim.keymap.set("n", "<leader>pT", "<leader>fT", { remap = true, desc = "Terminal (cwd)" })
