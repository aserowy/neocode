local M = {}

function M.scope(configuration, packer_compiled_path)
    require("packer").startup({
        configuration.register_packages,
        config = {
            compile_path = packer_compiled_path,
        },
    })

    configuration.configure()

    assert(loadfile(packer_compiled_path))()
end

return M
