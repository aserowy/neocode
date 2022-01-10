local function generate_sources(null_ls)
    local sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
    }

    if require("language.lsp.which").path_exists("markdownlint") then
        table.insert(sources, null_ls.builtins.diagnostics.markdownlint)
    end

    return sources
end

local M = {}
function M.setup(_, on_attach)
    local null_ls = require("null-ls")

    null_ls.setup({
        on_attach = on_attach,
        sources = generate_sources(null_ls),
    })
end

return M
