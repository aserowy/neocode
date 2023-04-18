local dap = require("dap")

local M = {}
function M.setup()
    dap.adapters.codelldb = function(cb, config)
        if config.preLaunchTask then
            vim.fn.system(config.preLaunchTask)
        end

        cb({
            type = "server",
            port = "${port}",
            options = {
                initialize_timeout_sec = 30,
            },
            executable = {
                -- NOTE: using flake.nix codelldb is in PATH with:
                -- export PATH=${vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter:$PATH
                command = "codelldb",
                args = { "--port", "${port}" },

                -- On windows you may have to uncomment this:
                -- detached = false,
            },
        })
    end

    dap.configurations.rust = {
        {
            name = "launch codelldb",
            type = "codelldb",
            request = "launch",
            program = function()
                os.execute("cargo build --quiet")
                return "target/debug/${workspaceFolderBasename}"
            end,
            args = {},
            stopOnEntry = false,
            runInTerminal = false,
            cwd = "${workspaceFolder}",
            env = {
                ["CARGO_MANIFEST_DIR"] = "${workspaceFolder}",
            },
        },
    }
end

return M
