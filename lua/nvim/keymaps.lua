local api = vim.api

local keymaps = {}
keymaps.register = function(scope, mappings, options)
    local opts
    if options == nil then
        opts = {
            nowait = true,
            silent = true,
            noremap = true,
        }
    else
        opts = options
    end

    for key, value in pairs(mappings) do
        api.nvim_set_keymap(scope, key, value, opts)
    end
end

keymaps.register_with_keymap = function(scope, mappings, options)
    local opts
    if options == nil then
        opts = {
            nowait = true,
            silent = true,
            noremap = true,
        }
    else
        opts = options
    end

    for key, value in pairs(mappings) do
        vim.keymap.set(scope, key, value, opts)
    end
end

keymaps.register_bufnr = function(bufnr, scope, mappings)
    local options = { noremap = true, silent = true }

    for key, value in pairs(mappings) do
        api.nvim_buf_set_keymap(bufnr, scope, key, value, options)
    end
end

return keymaps
