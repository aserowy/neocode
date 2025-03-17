local keymaps = require("nvim.keymaps")
local mappings = require("mappings")

local m = {}
m.on_attach = function(client, bufnr)
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
end

m.setup = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("language.lsp").setup(capabilities, m.on_attach)
end

return m
