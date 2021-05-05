local vim = vim

local settings = {
    theme = 'solarized-dark'
}

settings.setup = function ()
    vim.g.mapleader = '['

    local options = require'nvim.options'
    local option, buffer, window = options.scope.option, options.scope.buffer, options.scope.window

    -- options
    options.set(option, 'clipboard', 'unnamedplus')
    options.set(option, 'completeopt', 'menuone,noselect')
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

return settings
