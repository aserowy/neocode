local lsps = {
    require("language.lsp.lua"),
    require("language.lsp.rust"),
}

local M = {}
function M.setup(capabilities, on_attach)
    if not require("checker").packadd_if_exists("nvim-lspconfig") then
        return
    end

    for _, server in pairs(lsps) do
        if server ~= nil then
            server.setup(capabilities, on_attach)
        end
    end
end

return M
