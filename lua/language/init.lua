local keymaps = require("nvim.keymaps")
local mappings = require("mappings")

local m = {}

m.setup = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)

            if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, ev.buf)
            end

            keymaps.register_bufnr(ev.buf, "n", mappings.editor_on_text)
        end,
    })

    require("language.lsp").setup()
end

return m
