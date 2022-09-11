require("nvim-treesitter.install").prefer_git = true

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c_sharp",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "latex",
        "lua",
        "markdown",
        "nix",
        "python",
        "regex",
        "rust",
        "scss",
        "toml",
        "typescript",
        "yaml",
    },
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
    sync_install = false,

    -- third party
    rainbow = {
        enable = true,
    },
})
