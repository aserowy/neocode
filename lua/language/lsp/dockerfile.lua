local M = {}
function M.setup(capabilities, on_attach)
    if not require("language.lsp.which").path_exists("docker-langserver") then
        return
    end

    require("lspconfig").dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
