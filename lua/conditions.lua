local M = {}
M.is_nvim_environment = function()
    return vim.g.vscode == nil
end

M.is_vscode_environment = function()
    return vim.g.vscode ~= nil
end

M.is_current_theme = function(theme)
    return function()
        if not require'conditions'.is_nvim_environment() then
           return false
        end
        return require'settings'.theme().theme == theme
    end
end

return M
