local dap = require("dap")

function Dotnet_build_project()
    local default_path = vim.fn.getcwd() .. "/"
    if vim.g["dotnet_last_proj_path"] ~= nil then
        default_path = vim.g["dotnet_last_proj_path"]
    end

    local path = vim.fn.input("Path to your *proj file", default_path, "file")
    vim.g["dotnet_last_proj_path"] = path

    local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"

    print("")
    print("Cmd to execute: " .. cmd)

    local f = os.execute(cmd)
    if f == 0 then
        print("\nBuild succeded")
    else
        print("\nBuild failed with code: " .. f .. "")
    end
end

function Dotnet_get_dll_path()
    local request = function()
        return vim.fn.input("Path to dll", vim.g["dotnet_last_proj_path"] .. "/bin/Debug/", "file")
    end

    if vim.g["dotnet_last_dll_path"] == nil then
        vim.g["dotnet_last_dll_path"] = request()
    else
        if vim.fn.confirm("Do you want to change the path to dll? \n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
            == 1
        then
            vim.g["dotnet_last_dll_path"] = request()
        end
    end

    return vim.g["dotnet_last_dll_path"]
end

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

    dap.configurations.cs = {
        {
            type = "coreclr",
            name = "launch netcoredbg",
            request = "launch",
            program = function()
                if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
                    Dotnet_build_project()
                end

                return Dotnet_get_dll_path()
            end,
        },
    }
end

return M
