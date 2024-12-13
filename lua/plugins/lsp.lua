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
    {
        "seblj/roslyn.nvim",
        ft = "cs",
        opts = {
            exe = "Microsoft.CodeAnalysis.LanguageServer",
        },
    },
    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "select",
            })
        end,
    },

    "ray-x/lsp_signature.nvim",

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}
