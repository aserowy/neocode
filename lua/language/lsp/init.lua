local lsps = {
    require("language.lsp.angular"),
    require("language.lsp.bash"),
    require("language.lsp.c"),
    require("language.lsp.dockerfile"),
    require("language.lsp.go"),
    require("language.lsp.json"),
    require("language.lsp.null-ls"),
    require("language.lsp.lua"),
    require("language.lsp.markdown"),
    require("language.lsp.nix"),
    require("language.lsp.nu"),
    require("language.lsp.nx"),
    require("language.lsp.rust"),
    require("language.lsp.toml"),
    require("language.lsp.terraform"),
    require("language.lsp.typescript"),
    require("language.lsp.yaml"),
    require("language.lsp.zig"),
}

local function setup_lsp_styling()
    vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "󰅚" })
    vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "󰀪" })
    vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "󰋽" })
    vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "󰌶" })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "󰄮",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    vim.diagnostic.config({
        float = { border = "rounded" },
    })
end

local M = {}
function M.setup(capabilities, on_attach)
    setup_lsp_styling()

    for _, server in pairs(lsps) do
        if server ~= nil then
            server.setup(capabilities, on_attach)
        end
    end
end

return M
