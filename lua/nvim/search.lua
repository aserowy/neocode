local builtin = require("telescope.builtin")

local is_inside_work_tree = {}

local M = {}
function M.git_or_local()
    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end

    if is_inside_work_tree[cwd] then
        builtin.git_files({ use_git_root = false })
    else
        builtin.find_files()
    end
end

return M
