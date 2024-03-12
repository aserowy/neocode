local M = {}

local nvm_lsp = require("lspconfig")
function M.setup(capabilities, on_attach)
    nvm_lsp.angularls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = nvm_lsp.util.root_pattern("angular.json", "nx.json", "package.json"),
    })
end

return M
