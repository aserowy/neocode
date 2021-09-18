local M = {}
M.setup = function()
    local config = require("theming.configuration").get({
        style = "dark",
        transparent = false,
    })

    vim.g.onedark_disable_toggle_style = true
    vim.g.onedark_transparent_background = config.transparent

    require("onedark").setup()
end

return M
