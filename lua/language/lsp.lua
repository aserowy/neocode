local M = {}

function M.setup()
    vim.lsp.enable({
        'angularls',
        'bashls',
        'clangd',
        'dockerls',
        'gopls',
        'jsonls',   -- nix: vscode-langservers-extracted
        'lua_ls',   -- nix: lua-language-server
        'marksman', -- markdown
        'nixd',
        'nushell',
        'nxls',
        'roslyn_ls', -- csharp, nix: roslyn-ls
        'rust_analyzer',
        'taplo',     -- toml
        'terraformls',
        'ts_ls',
        'yamlls', -- nix: yaml-language-server
        'zls'
    })

    vim.lsp.config('angularls', {
        root_markers = { "angular.json", "nx.json", "package.json" }
    })

    vim.lsp.config('lua_ls', {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if
                    path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json')
                        or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                then
                    return
                end
            end
            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    version = 'LuaJIT',
                    path = {
                        'lua/?.lua',
                        'lua/?/init.lua',
                    },
                },
                telemetry = {
                    enable = false,
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        '${3rd}/busted/library',
                    }
                }
            })
        end,
        settings = {
            Lua = {}
        }
    })

    vim.lsp.config('yamlls', {
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
        }
    })
end

return M
