local M = {}
function M.setup(capabilities, on_attach)
    if not require("language.lsp.which").path_exists("rnix-lsp") then
        return
    end

    require("lspconfig").rnix.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
