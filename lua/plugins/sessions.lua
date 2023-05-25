return {
    {
        "olimorris/persisted.nvim",
        config = function()
            vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

            require("persisted").setup({
                autoload = true,
                use_git_branch = true,
            })

            require("telescope").load_extension("persisted")
        end,
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
}
