return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
        { "<C-p>", "<Cmd>Neotree toggle right<CR>", desc = "Neo-tree toggle" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        local streamer = require("theprimeagen.streamer")
        require('neo-tree').setup({
            filesystem = {
                filtered_items = streamer.neo_tree_filtered_items(),
            },
        })

        local function fix_light_mode_hl()
            if vim.o.background ~= "light" then return end
            local hl = vim.api.nvim_set_hl
            hl(0, "NeoTreeNormal",          { fg = "#383a42", bg = "#f0f0f0" })
            hl(0, "NeoTreeNormalNC",        { fg = "#383a42", bg = "#f0f0f0" })
            hl(0, "NeoTreeEndOfBuffer",     { fg = "#f0f0f0", bg = "#f0f0f0" })
            hl(0, "NeoTreeWinSeparator",    { fg = "#d0d0d0", bg = "#f0f0f0" })
            hl(0, "NeoTreeIndentMarker",    { fg = "#bcbec4" })
            hl(0, "NeoTreeExpander",        { fg = "#696c77" })
            hl(0, "NeoTreeGitModified",     { fg = "#e45649" })
            hl(0, "NeoTreeGitUntracked",    { fg = "#50a14f" })
            hl(0, "NeoTreeGitIgnored",      { fg = "#a0a1a7" })
            hl(0, "NeoTreeGitStaged",       { fg = "#4078f2" })
            hl(0, "NeoTreeGitConflict",     { fg = "#c18401", bold = true })
            hl(0, "NeoTreeFileName",        { fg = "#383a42" })
            hl(0, "NeoTreeFileNameOpened",  { fg = "#4078f2" })
            hl(0, "NeoTreeDirectoryName",   { fg = "#383a42", bold = true })
            hl(0, "NeoTreeDirectoryIcon",   { fg = "#4078f2" })
            hl(0, "NeoTreeRootName",        { fg = "#4078f2", bold = true })
        end

        fix_light_mode_hl()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = fix_light_mode_hl,
        })
    end
}
