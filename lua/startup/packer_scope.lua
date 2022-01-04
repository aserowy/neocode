local function file_exists(path)
    local f = io.open(path, "r")

    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local M = {}

function M.scope(configuration)
    local packer_compiled_path = configuration.path .. "/packer_compiled.lua"

    require("packer").startup({
        configuration.register_packages,
        config = {
            compile_path = packer_compiled_path,
            --package_root = configuration.path,
        },
    })

    configuration.configure()

    if file_exists(packer_compiled_path) then
        assert(loadfile(packer_compiled_path))()
    end
end

return M
