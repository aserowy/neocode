local M = {}
M.theme = function()
    return {
        theme = 'onedark',

        -- theme = 'darcula',

        -- theme = 'edge',
        -- style = 'default', 'aura', or 'neon'
        -- flavour = 'light', or 'dark'
        -- transparent = false,

        -- theme = 'nord',

        -- theme = 'onedark',
        -- transparent = false,

        -- theme = 'sonokai',
        -- style = 'default', 'atlantis', 'andromeda', 'shusia', or 'maia'
        -- transparent = false,

        -- theme = 'tokyonight',
        -- style = 'storm', 'night', or 'day'
        -- transparent = false,
    }
end

M.setup = function()
    vim.g.mapleader = '['

    local options = require'nvim.options'
    local option, buffer, window = options.scope.option, options.scope.buffer, options.scope.window

    vim.cmd([[set shortmess+=c]])

    -- options
    options.set(option, 'clipboard', 'unnamedplus')
    options.set(option, 'completeopt', 'menuone,noinsert,noselect')
    options.set(option, 'cursorline', true)
    options.set(option, 'hidden', true)
    options.set(option, 'ignorecase', true)
    options.set(option, 'mouse', 'a')
    options.set(option, 'showmode', false)
    options.set(option, 'smartcase', true)
    options.set(option, 'splitbelow', true)
    options.set(option, 'splitright', true)
    options.set(option, 'termguicolors', true)

    options.set(window, 'number', true)
    options.set(window, 'relativenumber', true)
    options.set(window, 'signcolumn', 'yes:2')

    options.set(buffer, 'expandtab', true)
    options.set(buffer, 'shiftwidth', 4)
    options.set(buffer, 'softtabstop', 4)
    options.set(buffer, 'tabstop', 4)
end

return M
