return {
    {
        "smoka7/hop.nvim",
        name = "hop",
        version = "*",
        config = function()
            require("hop").setup({})
        end,
    },
    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    },
    "unblevable/quick-scope",
}
