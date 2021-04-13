require'telescope'.setup {
    defaults = {
        -- https://github.com/glepnir/dashboard-nvim/issues/65
        layout_defaults = {
            flex = {
                flip_columns = 130
            }
        },
        layout_strategy = 'flex',
    }
}

