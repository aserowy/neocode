local M = {}
function M.setup(capabilities, on_attach)
    vim.filetype.add({ extension = { nu = "nu" } })

    require("lspconfig").nushell.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
