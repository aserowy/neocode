return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("language.plugin_treesitter")
        end,
        dependencies = {
            "p00f/nvim-ts-rainbow",
        },
        build = ":TSUpdate",
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("language.plugin_cmp").setup()
        end,
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
        },
    },
    "saadparwaiz1/cmp_luasnip",

    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("language.plugin_luasnip").setup()
        end,
    },
    "rafamadriz/friendly-snippets",
}
