local M = {
    lualine_theme = "tokyonight",
}

M.setup = function()
    require("tokyonight").setup({})
end

M.activate = function()
    local config = require("theming.configuration").get({
        style = "night",
        transparent = false,
    })

    require("tokyonight").setup({
        style = config.style,
        transparent = config.transparent,
    })

    vim.cmd([[colorscheme tokyonight]])
end

return M
