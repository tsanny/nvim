-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Alias pf to ff (find files)
vim.keymap.set("n", "<leader>pf", "<leader>ff", { remap = true, desc = "Find files" })

-- Alias pF to fF (find files recent)
vim.keymap.set("n", "<leader>pF", "<leader>fF", { remap = true, desc = "Find files recent" })

-- Alias ps to sg (grep search)
vim.keymap.set("n", "<leader>ps", "<leader>sg", { remap = true, desc = "Grep search" })

-- Alias pS to sG (grep search regex)
vim.keymap.set("n", "<leader>pS", "<leader>sG", { remap = true, desc = "Grep search regex" })

-- Alias C-p to e (neo-tree toggle)
vim.keymap.set("n", "<C-p>", "<leader>e", { remap = true, desc = "Neo-tree toggle" })
