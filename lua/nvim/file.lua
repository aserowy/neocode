local M = {}

function M.lines(path)
    if vim.fn.filereadable(path) ~= 1 then
        return {}
    end

    local lines = {}
    for line in io.lines(path) do
        lines[#lines + 1] = line
    end

    return lines
end

function M.resolve(lines)
    for i = 1, #lines do
        local file_path = table.concat(lines, "", 1, i)
        if vim.fn.filereadable(file_path) == 1 then
            return file_path
        end
    end
    return nil
end

return M
