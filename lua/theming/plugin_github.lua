local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "dark_default",
        transparent = false,
    })

    require("github-theme").setup({
        sidebars = { "Aerial", "NvimTree", "qf", "vista_kind", "terminal", "packer" },
        transparent = config.transparent,
    })
end

return M
