local o, wo, bo = vim.o, vim.wo, vim.bo
local options = {}

options.scope = {}

options.scope.option = { o }
options.scope.buffer = { o, bo }
options.scope.window = { o, wo }

options.set = function(scope, option, value)
    for _, s in ipairs(scope) do
        s[option] = value
    end
end

return options
