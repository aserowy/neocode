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
M.packadd_if_exists = function(...)
    for _, plugin in ipairs({...}) do
        if not packadd_if_exists(plugin) then
            return false
        end
    end
    return true
end

return M
