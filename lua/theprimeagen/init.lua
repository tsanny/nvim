require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and vim.bo[e.buf].filetype == "python" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = e.buf, desc = "LSP workspace symbols" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = e.buf, desc = "LSP line diagnostics" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = e.buf, desc = "LSP code action" })
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = e.buf, desc = "LSP code action" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = e.buf, desc = "LSP references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = e.buf, desc = "LSP rename" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_user_command("CopyFilePath", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy current file absolute path" })

vim.api.nvim_create_user_command("CopyFilePathRel", function()
    vim.fn.setreg("+", vim.fn.expand("%"))
end, { desc = "Copy current file relative path" })
