return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("navigation.plugin_tree")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("navigation.plugin_trouble")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("navigation.plugin_telescope").setup()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-dap.nvim",
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
