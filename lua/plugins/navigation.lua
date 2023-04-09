return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("navigation.plugin_tree")
        end,
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("navigation.plugin_trouble")
        end,
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("navigation.plugin_telescope").setup()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim", 
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
