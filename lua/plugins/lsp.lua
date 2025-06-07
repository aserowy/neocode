return {
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
        config = function()
            vim.g.guard_config = {
                fmt_on_save = true,
                lsp_as_default_formatter = true,
                save_on_fmt = true,
                auto_lint = true,
                lint_interval = 500,
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig.ui.windows").default_options = { border = "rounded" }
        end,
    },
    {
        "zk-org/zk-nvim",
        config = function()
            require("zk").setup({
                picker = "select",
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        opts = { bind = true }
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}
