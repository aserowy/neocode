return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig.ui.windows").default_options = { border = "rounded" }
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    "ray-x/lsp_signature.nvim",

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}
