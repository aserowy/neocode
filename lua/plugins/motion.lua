return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        --@type Flash.Config
        opts = {
            modes = {
                char = {
                    enabled = false,
                },
            },
        },
    },
    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    },
}
