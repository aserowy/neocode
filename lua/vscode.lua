local function set_settings()
    vim.g.mapleader = '['

    local options = require'nvim.options'
    local option = options.scope.option

    options.set(option, 'clipboard', 'unnamedplus')
    options.set(option, 'ignorecase', true)
    options.set(option, 'smartcase', true)
    options.set(option, 'termguicolors', true)
end

local function set_theme()
    vim.cmd([[hi QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
    vim.cmd([[hi QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])
end

local function set_mappings()
    require'nvim.keymaps'.register('n', {
        ['<C-b><C-s>'] = [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]],
        ['ga'] = [[<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>]],
        ['gi'] = [[<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>]],
        ['gn'] = [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]],
        ['gp'] = [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]],
        ['gq'] = [[<cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>]],
        ['gr'] = [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]],
    })

    vim.cmd([[nmap <Leader>k <Plug>(easymotion-bd-f)]])
    vim.cmd([[nmap <Leader>l <Plug>(easymotion-bd-jk)]])
    vim.cmd([[nmap <Leader>w <Plug>(easymotion-bd-w)]])
end

local function setup()
    set_settings()
    set_theme()
    set_mappings()
end

return {
    setup = setup
}
