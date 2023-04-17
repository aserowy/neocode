local dap = require("dap")

local M = {}
function M.setup()
    dap.adapters.coreclr = function(cb, config)
        if config.preLaunchTask then
            vim.fn.system(config.preLaunchTask)
        end

        cb({
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
        })
    end

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
