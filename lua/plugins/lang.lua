local function setup_treesitter()
    require("nvim-treesitter.install").prefer_git = true

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "angular",
            "bash",
            "bicep",
            "c",
            "c_sharp",
            "css",
            "csv",
            "dockerfile",
            "go",
            "graphql",
            "html",
            "htmldjango",
            "hyprlang",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "lua",
            "markdown",
            "nix",
            "nu",
            "python",
            "regex",
            "rust",
            "scss",
            "terraform",
            "toml",
            "typescript",
            "yaml",
            "yuck",
            "zig",
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
            is_supported = function()
                local mode = vim.api.nvim_get_mode().mode
                if mode == "c" then
                    return false
                end
                return true
            end,
        },
        sync_install = false,
    })
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            setup_treesitter()
        end,
        build = ":TSUpdate",
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = { preset = "super-tab" },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true
                    },
                },
            },
        },
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    "onsails/lspkind-nvim",
}
