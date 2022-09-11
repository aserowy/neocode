local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "dark",
        transparent = false,
    })


    require("onedark").setup({
        style = config.style,
        transparent = config.transparent,
        transparent_sidebar = config.transparent,
    })

    require("onedark").load()
end

return M
