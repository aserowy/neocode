local M = {
    lualine_theme = "tokyonight",
}

M.setup = function()
    require("catppuccin").setup({})
end

M.activate = function()
    local config = require("theming.configuration").get({
        style = "night",
        transparent = false,
    })

    require("catppuccin").setup({
        flavour = config.style,
        transparent_background = config.transparent,
    })

    vim.cmd([[colorscheme catppuccin]])
end

return M
