local vim = vim
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then
        scopes['o'][key] = value
    end
end

-- config
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

vim.g.mapleader = ' '

opt('w', 'number', true)
opt('w', 'relativenumber', true)

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', 4)
opt('b', 'tabstop', 4)
