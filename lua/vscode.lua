local vim = vim

local init_code = {}

local function set_settings()
    vim.g.mapleader = '['

    local options = require'nvim.options'
    local option, buffer = options.scope.option, options.scope.buffer

    options.set(option, 'clipboard', 'unnamedplus')
    options.set(option, 'ignorecase', true)
    options.set(option, 'smartcase', true)
    options.set(option, 'termguicolors', true)

    options.set(buffer, 'expandtab', true)
    options.set(buffer, 'shiftwidth', 4)
    options.set(buffer, 'softtabstop', 4)
    options.set(buffer, 'tabstop', 4)
end

local function register_plugins()
    require'packer'.startup(
        function(use)
            use 'wbthomason/packer.nvim'

            use 'unblevable/quick-scope'
            use {'phaazon/hop.nvim', as = 'hop', config = function() require'hop'.setup {} end}
        end)
end

local function set_theme()
    vim.cmd([[hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
    vim.cmd([[hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])
end

local function set_mappings()
    require'nvim.keymaps'.register('n', {
        ['ga'] = [[<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>]],
        ['gn'] = [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]],
        ['gp'] = [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]],
        ['gq'] = [[<cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>]],
        ['gr'] = [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]],
        ['gs'] = [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]],

        ['<leader>w'] = [[<cmd>HopWord<cr>]],
    })
end

init_code.setup = function ()
    set_settings()
    register_plugins()
    set_theme()
    set_mappings()
end

return init_code
