local function setup_theme(theme)
    if theme == require("settings").theme().theme then
        require("theming.theme").setup(theme)
    end
end

return {
    {
        "catppuccin/nvim",
        config = function()
            setup_theme("catppuccin")
        end,
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            setup_theme("onedark")
        end,
    },
    {
        "hardhackerlabs/theme-vim",
        config = function()
            setup_theme("hardhacker")
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            setup_theme("tokyonight")
        end,
    },
}
