local ts_config = require'nvim-treesitter.configs'
local mappings = require'mappings'

ts_config.setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
        enable = true
    },

    -- third party
    rainbow = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = mappings.editor_motion_textobjects
        }
    }
}
