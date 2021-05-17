local keymaps = require'nvim.keymaps'
local mappings = require'mappings'

local function on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    keymaps.register_bufnr(bufnr, 'n', mappings.editor_on_text)
end

local m = {}
m.setup = function ()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = '𥉉 '
            },
        }
    )

    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end
end

m.reinstall = function ()
    local lspinstall = require'lspinstall'
    for _, server in ipairs(lspinstall.installed_servers()) do
        lspinstall.install_server(server)
    end
end

require'lspinstall'.post_install_hook = function()
    m.setup()
    vim.cmd("bufdo e")
end

return m
