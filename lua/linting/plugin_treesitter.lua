local ts_config = require'nvim-treesitter.configs'
local mappings = require'mappings'

require'nvim-treesitter.install'.compilers = {
    "clang",
    vim.fn.getenv('CC'),
    "cc",
    "gcc",
    "cl",
}

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
    textsubjects = {
        enable = true,
        keymaps = mappings.editor_motion_textsubjects
    },
}
