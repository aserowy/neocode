local lsps = {
    require("language.lsp.dockerfile"),
    require("language.lsp.null-ls"),
    require("language.lsp.lua"),
    require("language.lsp.nix"),
    require("language.lsp.rust"),
}

local M = {}
function M.setup(capabilities, on_attach)
    for _, server in pairs(lsps) do
        if server ~= nil then
            server.setup(capabilities, on_attach)
        end
    end
end

return M
