return {
    {
        "aserowy/tmux.nvim",
        config = function()
            require("terminal.plugin_tmux").setup()
        end,
    },
}
