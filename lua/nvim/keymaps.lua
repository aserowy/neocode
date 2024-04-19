local api = vim.api

local function scope_to_table(scope)
    if type(scope) == "table" then
        return scope
    end

    return {
        [1] = scope,
    }
end

local keymaps = {}
keymaps.register = function(scopes, mappings, options)
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

    for _, scope in pairs(scope_to_table(scopes)) do
        for key, value in pairs(mappings) do
            vim.keymap.set(scope, key, value, opts)
        end
    end
end

keymaps.register_bufnr = function(bufnr, scope, mappings)
    local options = { noremap = true, silent = true }

    for key, value in pairs(mappings) do
        api.nvim_buf_set_keymap(bufnr, scope, key, value, options)
    end
end

return keymaps
