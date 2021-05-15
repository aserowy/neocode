require'gitsigns'.setup({
    signs = {
        add = {hl = 'DiffAdd', text = '▌'},
        change = {hl = 'DiffChange', text = '▌'},
        delete = {hl = 'DiffDelete', text = '_'},
        topdelete = {hl = 'DiffDelete', text = '‾'},
        changedelete = {hl = 'DiffChange', text = '~'}
    },
    numhl = false,
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil
})
