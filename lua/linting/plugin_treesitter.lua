require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },

    -- third party
    rainbow = {
        enable = true,
    },
    textsubjects = {
        enable = true,
        keymaps = require("mappings").editor_motion_textsubjects,
    },
})
