local keymaps = require("nvim.keymaps")
local mappings = require("mappings")

---@diagnostic disable-next-line: unused-local
local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "single",
        },
        hint_enable = false,
    })

    keymaps.register_bufnr(bufnr, "n", mappings.editor_on_text)
end

local m = {}
m.setup = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require("language.lsp").setup(capabilities, on_attach)
end

return m
