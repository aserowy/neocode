local function packadd_if_exists(plugin)
    local plugin_prefix = vim.fn.stdpath('data')..'/site/pack/packer/opt/'
    local plugin_path = plugin_prefix..plugin..'/'

    local ok, err, code = os.rename(plugin_path, plugin_path)

    if ok then
        vim.cmd('packadd '..plugin)
    else
        print(ok, err, code)
        return false
    end

    return true
end

local M = {}
M.packadd_if_exists = function(plugin)
    return packadd_if_exists(plugin)
end

M.packadd_if_exists_for = function(plugins)
    for _, plugin in pairs(plugins) do
        if not packadd_if_exists(plugin) then
            return false
        end
    end
    return true
end

return M
