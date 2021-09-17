local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "dark",
        transparent = false,
    })

    require("github-theme").setup({
        sidebars = { "Aerial", "NvimTree", "qf", "vista_kind", "terminal", "packer" },
        theme_style = config.style,
        transparent = config.transparent,
    })
end

return M
