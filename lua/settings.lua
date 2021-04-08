local vim = vim

local options = require'nvim.options'
local option, buffer, window = options.scope.option, options.scope.buffer, options.scope.window

vim.g.mapleader = ' '

options.set(option, 'completeopt', 'menuone,noselect')
options.set(option, 'hidden', true)
options.set(option, 'ignorecase', true)
options.set(option, 'mouse', 'a')
options.set(option, 'splitbelow', true)
options.set(option, 'splitright', true)
options.set(option, 'termguicolors', true)

options.set(window, 'number', true)
options.set(window, 'relativenumber', true)
options.set(window, 'signcolumn', 'yes')

options.set(buffer, 'expandtab', true)
options.set(buffer, 'shiftwidth', 4)
options.set(buffer, 'softtabstop', 4)
options.set(buffer, 'tabstop', 4)
