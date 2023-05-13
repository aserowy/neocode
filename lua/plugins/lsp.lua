return {
    "neovim/nvim-lspconfig",
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}
