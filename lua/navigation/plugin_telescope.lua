local actions = require'telescope.actions'
local mapping = require'mappings'

require'telescope'.setup {
    defaults = {
        mappings = {
            i = mapping.search(actions),
            n = mapping.search(actions),
        },
        -- TODO: https://github.com/glepnir/dashboard-nvim/issues/65
        layout_defaults = {
            flex = {
                flip_columns = 130
            }
        },
        layout_strategy = 'flex',
    }
}
