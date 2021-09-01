local M = {}
function M.setup(_, on_attach)
    local null_ls = require("null-ls")
    null_ls.config({
        sources = {
            null_ls.builtins.diagnostics.markdownlint,

            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.rustfmt,
            null_ls.builtins.formatting.stylua,
        },
    })

    require("lspconfig")["null-ls"].setup({
        on_attach = on_attach,
    })
end

return M
