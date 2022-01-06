require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = require("mappings").editor_motion_textsubjects,
    },
    sync_install = true,

    -- third party
    rainbow = {
        enable = true,
    },
})
