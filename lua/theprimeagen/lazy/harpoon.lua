
local harpoon = {
    {
        "ThePrimeagen/harpoon",
        config = function()
            local mark = require("harpoon.mark")
            local harpoon_ui = require("harpoon.ui")

            require("harpoon").setup()

            vim.keymap.set("n", "<leader>A", function() mark.add_file() end, { desc = "Harpoon add file" })
            vim.keymap.set("n", "<leader>a", function() mark.add_file() end, { desc = "Harpoon add file" })
            vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu)

            vim.keymap.set("n", "<C-h>", function() harpoon_ui.nav_file(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon_ui.nav_file(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon_ui.nav_file(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon_ui.nav_file(4) end)
            vim.keymap.set("n", "<leader><C-h>", function() mark.rm_file(1) end, { desc = "Harpoon remove file 1" })
            vim.keymap.set("n", "<leader><C-j>", function() mark.rm_file(2) end, { desc = "Harpoon remove file 2" })
            vim.keymap.set("n", "<leader><C-k>", function() mark.rm_file(3) end, { desc = "Harpoon remove file 3" })
            vim.keymap.set("n", "<leader><C-l>", function() mark.rm_file(4) end, { desc = "Harpoon remove file 4" })
        end
    },
    -- {
    --     "vim-apm", dir = "~/personal/vim-apm",
    --     config = function()
    --         --[[
    --         local apm = require("vim-apm")
    --
    --         apm:setup({})
    --         vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
    --         --]]
    --     end
    -- },
    -- {
    --     "vim-with-me", dir = "~/personal/vim-with-me",
    --     config = function() end
    -- },
}

return harpoon
