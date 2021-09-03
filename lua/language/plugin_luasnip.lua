local luasnip = require("luasnip")

local M = {}
function M.setup()
    luasnip.config.set_config({
        history = true,
    })

    require("luasnip/loaders/from_vscode").load()
end

return M
