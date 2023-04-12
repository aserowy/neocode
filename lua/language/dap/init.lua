local daps = {
    require("language.dap.rust"),
}

local M = {}
function M.setup()
    for _, server in pairs(daps) do
        if server ~= nil then
            server.setup()
        end
    end
end

return M
