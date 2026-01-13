return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    cmd = "Telescope",
    keys = {
        {
            "<leader>pf",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<C-p>",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Telescope git files",
        },
        {
            "<leader>pws",
            function()
                local word = vim.fn.expand("<cword>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Telescope grep word",
        },
        {
            "<leader>pWs",
            function()
                local word = vim.fn.expand("<cWORD>")
                require("telescope.builtin").grep_string({ search = word })
            end,
            desc = "Telescope grep WORD",
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Telescope grep",
        },
        {
            "<leader>vh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope help tags",
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup({})
    end,
}
