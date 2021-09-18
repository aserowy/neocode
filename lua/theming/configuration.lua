local function extend(policy, ...)
    local function helper(inner_policy, k, v1, v2)
        if type(v1) ~= "table" or type(v2) ~= "table" then
            if inner_policy == "error" then
                error("Key " .. vim.inspect(k) .. " is already present with value " .. vim.inspect(v1))
            elseif inner_policy == "force" then
                return v2
            else
                return v1
            end
        else
            return extend(inner_policy, v1, v2)
        end
    end

    local result = {}
    for _, t in ipairs({ ... }) do
        for k, v in pairs(t) do
            if result[k] ~= nil then
                result[k] = helper(policy, k, result[k], v)
            else
                result[k] = v
            end
        end
    end

    return result
end

local M = {
    sidebars = { "outline", "Aerial", "NvimTree", "qf", "vista_kind", "terminal", "packer" },
}

M.get = function(defaults)
    local theme = require("settings").theme()
    return extend("force", defaults, theme)
end

return M
