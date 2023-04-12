local dap = require("dap")

local M = {}
function M.setup()
    dap.adapters.lldb = {
        type = "executable",
        command = "lldb",
        name = "lldb",
    }

    local lldb = {
        name = "Launch lldb",
        -- matches the adapter
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    }

    dap.configurations.rust = {
        lldb,
    }
end

return M
