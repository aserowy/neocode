local dap = require("dap")

local M = {}
function M.setup()
    dap.adapters.codelldb = {
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
    }

    dap.configurations.rust = {
        {
            type = "codelldb",
            request = "launch",
            -- This is where cargo outputs the executable
            program = function()
                os.execute('sh -c "cargo build &> /dev/null"')
                return "target/debug/${workspaceFolderBasename}"
            end,
            args = {},
            -- args = function()
            --     local argv = {}
            --     arg = vim.fn.input(string.format("argv: "))
            --     for a in string.gmatch(arg, "%S+") do
            --         table.insert(argv, a)
            --     end
            --     return argv
            -- end,
            stopOnEntry = false,
            runInTerminal = false,
            cwd = "${workspaceFolder}",
            -- MIMode = "gdb",
            -- miDebuggerPath = "/usr/bin/gdb",
            -- setupCommands = {
            --     {
            --         text = "-enable-pretty-printing",
            --         description = "enable pretty printing",
            --         ignoreFailures = false,
            --     },
            -- },
        },
    }
end

return M
