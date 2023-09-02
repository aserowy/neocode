local lsps = {
    require("language.lsp.bash"),
    require("language.lsp.c"),
    require("language.lsp.csharp"),
    require("language.lsp.dockerfile"),
    require("language.lsp.go"),
    require("language.lsp.null-ls"),
    require("language.lsp.lua"),
    require("language.lsp.nix"),
    require("language.lsp.rust"),
    require("language.lsp.terraform"),
    require("language.lsp.yaml"),
}

local M = {}
function M.setup(capabilities, on_attach)
    vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "󰅚" })
    vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "󰀪" })
    vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "󰋽" })
    vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "󰌶" })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "󰄮",
        },
    })

    for _, server in pairs(lsps) do
        if server ~= nil then
            server.setup(capabilities, on_attach)
        end
    end
end

return M
