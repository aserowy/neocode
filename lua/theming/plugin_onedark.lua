local M = {}
M.setup = function()
    local config = require("theming.configuration").get({})

    require("onedark").setup({
        sidebars = config.sidebars,
    })
end

return M
