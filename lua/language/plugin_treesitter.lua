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

    -- third party
    rainbow = {
        enable = true,
    },
})
