local ts_config = require'nvim-treesitter.configs'
local keymaps = require'keymaps'

ts_config.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true
    },
    incremental_selection = {
        enable = true,
        keymaps = keymaps.tree_sitter_incremental(),
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
            keymaps = keymaps.tree_sitter_textobjects() 
        }
    }
}
