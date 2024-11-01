local util = require("lspconfig.util")
local config = require("lspconfig.configs")

local M = {}
function M.setup(capabilities, on_attach)
    config.vsjsonls = {
        default_config = {
            cmd = { "vscode-json-languageserver", "--stdio" },
            filetypes = { "json", "jsonc" },
            root_dir = util.find_git_ancestor,
            single_file_support = true,
        },
    }

    require("lspconfig").vsjsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
