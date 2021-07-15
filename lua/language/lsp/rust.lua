local M = {}
function M.setup(capabilities, on_attach)
    if not require("language.lsp.which").path_exists("rust-analyzer") then
        return
    end

    require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
