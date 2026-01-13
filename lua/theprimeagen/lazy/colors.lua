local function set_transparent_background()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode").setup({
            transparent = true,
        })
        vim.cmd.colorscheme("vscode")
        set_transparent_background()
    end,
}
