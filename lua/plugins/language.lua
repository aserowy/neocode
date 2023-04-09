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
        after = "nvim-treesitter",
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

    {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("nvim-lsp-installer").setup({})
        end,
    },
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",

    {
        "b3nj5m1n/kommentary",
        config = function()
            require("kommentary.config")
        end,
    },
}
