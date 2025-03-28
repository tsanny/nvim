return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                },
                layout = {
                    position = "bottom", -- | top | left | right | horizontal | vertical
                    ratio = 0.4
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                hide_during_completion = true,
                debounce = 75,
                keymap = {
                    accept = "<C-y>",        -- Ctrl+y to accept suggestion
                    accept_word = "<C-w>",   -- Ctrl+w to accept word
                    accept_line = "<C-l>",   -- Ctrl+l to accept line
                    next = "<C-n>",          -- Ctrl+n for next suggestion
                    prev = "<C-p>",          -- Ctrl+p for previous suggestion
                    dismiss = "<C-e>",       -- Ctrl+e to dismiss
                },
            },
            filetypes = {
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            logger = {
                file = vim.fn.stdpath("log") .. "/copilot-lua.log",
                file_log_level = vim.log.levels.OFF,
                print_log_level = vim.log.levels.WARN,
                trace_lsp = "off", -- "off" | "messages" | "verbose"
                trace_lsp_progress = false,
                log_lsp_messages = false,
            },
            copilot_node_command = 'node', -- Node.js version must be > 18.x
            workspace_folders = {},
            copilot_model = "",            -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
            root_dir = function()
                return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
            end,
            -- should_attach = function(_, _)
            --     if not vim.bo.buflisted then
            --         logger.debug("not attaching, buffer is not 'buflisted'")
            --         return false
            --     end
            --
            --     if vim.bo.buftype ~= "" then
            --         logger.debug("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
            --         return false
            --     end
            --
            --     return true
            -- end,
            server_opts_overrides = {},
        })
    end,
}
