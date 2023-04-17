local dap = require("dap")

local M = {}
function M.setup()
    dap.adapters.coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
    }

    -- NOTE: current support with launch.json
    -- dap.configurations.cs = {
    --     {
    --         type = "coreclr",
    --         request = "launch",
    --         program = function()
    --             return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    --         end,
    --     },
    -- }
end

return M
