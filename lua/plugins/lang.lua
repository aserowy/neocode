return {
    {
        "romus204/tree-sitter-manager.nvim",
        config = function()
            require("tree-sitter-manager").setup({
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
            })
        end,
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
                    window = {
                        border = 'rounded',
                    },
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true
                    },
                },
                menu = {
                    border = 'rounded',
                },
            },
        },
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    "onsails/lspkind-nvim",
}
