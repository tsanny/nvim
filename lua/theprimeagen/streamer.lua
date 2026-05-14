local M = {}

-- true = streaming: hide dotfiles, mask .env values
-- false = dev mode: show everything (default)
vim.g.streamer_mode = vim.g.streamer_mode or false

function M.is_streaming()
    return vim.g.streamer_mode == true
end

function M.neo_tree_filtered_items()
    local streaming = M.is_streaming()
    return {
        hide_dotfiles = streaming,
        hide_gitignored = true,
        hide_hidden = streaming,
        visible = not streaming,
    }
end

function M.toggle()
    vim.g.streamer_mode = not vim.g.streamer_mode
    local streaming = M.is_streaming()

    local cloak_ok, cloak = pcall(require, "cloak")
    if cloak_ok then
        if streaming then cloak.enable() else cloak.disable() end
    end

    local neo_ok, neo_tree = pcall(require, "neo-tree")
    if neo_ok then
        neo_tree.setup({ filesystem = { filtered_items = M.neo_tree_filtered_items() } })
        pcall(function()
            require("neo-tree.sources.manager").refresh("filesystem")
        end)
    end

    vim.notify("Streamer mode " .. (streaming and "ON  (dotfiles hidden, .env masked)" or "OFF (dotfiles visible, .env shown)"), vim.log.levels.INFO)
end

return M
