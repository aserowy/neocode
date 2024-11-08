-- local helper = require("null-ls.helpers")
-- local nufmt = helper.make_builtin({
--     name = "nufmt",
--     meta = {
--         url = "https://github.com/nushell/nufmt",
--         description = "",
--     },
--     method = require("null-ls.methods").internal.FORMATTING,
--     filetypes = { "nu" },
--     generator_opts = {
--         command = "nufmt",
--         args = { "--stdin" },
--         to_stdin = true,
--     },
--     factory = helper.formatter_factory,
-- })

local function generate_sources(null_ls)
    local sources = {
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.terraform_validate,

        -- FIX: nufmt is currently unuseable
        -- nufmt,

        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.djlint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { "cshtml" },
        }),
        null_ls.builtins.formatting.shfmt,
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
