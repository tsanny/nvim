return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            show_help = false,
            delay = 250,
            icons = {
                mappings = false,
            },
        })
    end,
}
