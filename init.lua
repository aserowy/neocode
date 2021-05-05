local vim = vim

if not vim.g.vscode then
    require'settings'.setup()
    require'plugins'
    require'theme'

    require'mappings'
else
    require'nvim.keymaps'.register('n', {
        ['gc'] = [[<cmd>call VSCodeNotify('editor.action.formatDocument')<cr>]],
        ['gn'] = [[<cmd>call VSCodeNotify('editor.action.marker.next')<cr>]],
        ['gp'] = [[<cmd>call VSCodeNotify('editor.action.marker.prev')<cr>]],
        ['gq'] = [[<cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>]],
        ['gr'] = [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]],
        ['gs'] = [[<cmd>call VSCodeNotify('workbench.action.files.save')<cr>]],
    })
end

