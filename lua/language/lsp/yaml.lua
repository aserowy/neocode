local M = {}
function M.setup(capabilities, on_attach)
    require("lspconfig").yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            yaml = {
                completion = true,
                format = { enable = true },
                hover = true,
                validate = true,

                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                        "/.devops/*.y*l",
                        "/.pipelines/*.y*l",
                        "/azure-pipeline*.y*l",
                        "/pipelines/*.y*l",
                    },
                },
            },
        },
    })
end

return M
