local dap = require("dap")

function Dotnet_build_project()
    local request = function()
        return vim.fn.input("Path to *proj", vim.fn.getcwd() .. "/", "file")
    end

    if vim.g["dotnet_last_proj_path"] == nil then
        vim.g["dotnet_last_proj_path"] = request()
    else
        if vim.fn.confirm("Change project path? \n" .. vim.g["dotnet_last_proj_path"], "&yes\n&no", 2) == 1 then
            vim.g["dotnet_last_proj_path"] = request()
        end
    end

    local cmd = "dotnet build -c Debug " .. vim.g["dotnet_last_proj_path"] .. " > /dev/null"

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
        return vim.fn.input("Path to dll", vim.g["dotnet_last_proj_path"] .. "bin/Debug/", "file")
    end

    if vim.g["dotnet_last_dll_path"] == nil then
        vim.g["dotnet_last_dll_path"] = request()
    else
        if vim.fn.confirm("Change dll path for debugging? \n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2) == 1
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
                Dotnet_build_project()
                return Dotnet_get_dll_path()
            end,
            cwd = function()
                return vim.g["dotnet_last_proj_path"]
            end,
            env = {
                ["DOTNET_ENVIRONMENT"] = "Development",
            },
        },
    }
end

return M
