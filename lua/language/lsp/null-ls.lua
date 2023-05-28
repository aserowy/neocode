local function generate_sources(null_ls)
    local sources = {
        null_ls.builtins.diagnostics.markdownlint,

        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.deno_fmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.nixpkgs_fmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
    }

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
