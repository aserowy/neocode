local function generate_sources(null_ls)
    local helpers = require("null-ls.helpers")
    local methods = require("null-ls.methods")

    local sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
    }

    if require("language.lsp.which").path_exists("markdownlint") then
        table.insert(sources, null_ls.builtins.diagnostics.markdownlint)
    end

    if require("language.lsp.which").path_exists("nixpkgs-fmt") then
        table.insert(sources, helpers.make_builtin({
            method = methods.internal.FORMATTING,
            filetypes = { "nix" },
            generator_opts = {
                command = "nixpkgs-fmt",
                to_stdin = true,
            },
            factory = helpers.formatter_factory,
        }))
    end

    return sources
end

local M = {}
function M.setup(_, on_attach)
    local null_ls = require("null-ls")

    null_ls.config({
        sources = generate_sources(null_ls),
    })

    require("lspconfig")["null-ls"].setup({
        on_attach = on_attach,
    })
end

return M
