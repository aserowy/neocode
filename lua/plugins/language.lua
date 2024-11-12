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

        -- third party
        rainbow = {
            enable = true,
        },
    })
end

local function setup_luasnip()
    local luasnip = require("luasnip")

    luasnip.config.set_config({
        history = true,
    })

    require("luasnip/loaders/from_vscode").load()
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            setup_treesitter()
        end,
        dependencies = {
            { "p00f/nvim-ts-rainbow" },

            -- NOTE: additional parser
            { "nushell/tree-sitter-nu" },
        },
        build = ":TSUpdate",
    },
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = 'enter',
        },
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            setup_luasnip()
        end,
    },
    "onsails/lspkind-nvim",
}
