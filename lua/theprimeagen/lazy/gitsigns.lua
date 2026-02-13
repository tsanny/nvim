return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 300,
            },
            current_line_blame_formatter = "<author> • <author_time:%Y-%m-%d %H:%M> • <summary> • <abbrev_sha>",
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "]h", gs.next_hunk, opts)
                vim.keymap.set("n", "[h", gs.prev_hunk, opts)
                vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = bufnr, desc = "Git preview hunk" })
                vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Git diff this" })
                vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr, desc = "Git reset hunk" })
                vim.keymap.set("n", "<leader>gb", gs.blame_line, { buffer = bufnr, desc = "Git blame line" })
                vim.keymap.set("n", "<leader>gB", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Git toggle line blame" })
            end,
        })
    end,
}
