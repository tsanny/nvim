local plugins = {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "eandrju/cellular-automaton.nvim",
}

local harpoon = require("theprimeagen.lazy.harpoon")
vim.list_extend(plugins, harpoon)

return plugins
