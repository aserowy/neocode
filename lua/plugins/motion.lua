return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        --@type Flash.Config
        opts = {
            modes = {
                char = {
                    autohide = true,
                    highlight = { backdrop = false },
                    jump_labels = true,
                    multi_line = false,
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
