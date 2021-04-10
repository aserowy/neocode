local vim = vim

local keymaps = require'nvim.keymaps'
local mappings = require'mappings'

local function on_attach(_, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    keymaps.register_bufnr(bufnr, 'n', mappings.lsp_on_attach)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = capabilities,
            on_attach = on_attach
        }
    end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
    setup_servers()
    vim.cmd("bufdo e")
end
