-- TODO: https://github.com/wbthomason/packer.nvim/issues/272
if not require'theming.packer'.packadd_if_exists('popup.nvim') then
    return
end
if not require'theming.packer'.packadd_if_exists('plenary.nvim') then
    return
end

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
