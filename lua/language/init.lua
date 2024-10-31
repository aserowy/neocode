local keymaps = require("nvim.keymaps")
local mappings = require("mappings")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end

    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "single",
        },
        hint_enable = false,
    })

    keymaps.register_bufnr(bufnr, "n", mappings.editor_on_text)

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = augroup,
            buffer = bufnr, callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

local m = {}
m.setup = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("language.lsp").setup(capabilities, on_attach)
end

return m
