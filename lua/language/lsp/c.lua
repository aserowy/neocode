local M = {}
function M.setup(capabilities, on_attach)
    -- require("lspconfig").ccls.setup({
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    -- })

    require("lspconfig").clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
