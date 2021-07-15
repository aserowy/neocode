local M = {}
function M.path_exists(cmd_name)
    local handle = assert(io.popen("which " .. cmd_name))
    local result = handle:read("*a")
    handle:close()

    local match = cmd_name:gsub("%-", "%%%-")
    return result:match("/.+/" .. match) ~= nil
end

return M
