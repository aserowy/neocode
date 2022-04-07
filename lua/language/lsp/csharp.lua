local M = {}
function M.setup(capabilities, on_attach)
    local pid = vim.fn.getpid()

    require("lspconfig").omnisharp.setup({
        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
