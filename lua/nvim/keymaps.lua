local vim = vim
local api = vim.api

local keymaps = {}
keymaps.register = function (scope, mappings, options)
    local opts = vim.tbl_extend('keep', options or {}, {
        nowait = true,
        silent = true,
        noremap = true,
    })

    for key, value in pairs(mappings) do
        api.nvim_set_keymap(scope, key, value, opts)
    end
end

keymaps.register_bufnr = function (bufnr, scope, mappings)
    local options = {noremap = true, silent = true}

    for key, value in pairs(mappings) do
        api.nvim_buf_set_keymap(bufnr, scope, key, value, options)
    end
end

return keymaps
