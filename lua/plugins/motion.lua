return {
    {
        "phaazon/hop.nvim",
        name = "hop",
        branch = "v2",
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
