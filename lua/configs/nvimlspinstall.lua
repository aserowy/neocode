local vim = vim

local keymaps = require'nvim.keymaps'
local mappings = require'mappings'

local function on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    keymaps.register_bufnr(bufnr, 'n', mappings.lsp_on_attach)
end

local function setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end
end

local function reinstall()
    local lspinstall = require'lspinstall'
    for _, server in ipairs(lspinstall.installed_servers()) do
        lspinstall.install_server(server)
    end
end

require'lspinstall'.post_install_hook = function()
    setup()
    vim.cmd("bufdo e")
end

setup()

local m = {}
m.reinstall = reinstall

return m
