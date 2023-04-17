local dap = require("dap")
local dapui = require("dapui")

local daps = {
    require("language.dap.dotnet"),
    require("language.dap.rust"),
}

local M = {}
function M.setup()
    for _, server in pairs(daps) do
        if server ~= nil then
            server.setup()
        end
    end

    require("dap.ext.vscode").load_launchjs(nil, {})
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

return M
