if not require("checker").packadd_if_exists("telescope.nvim") then
    return
end

local function git_or_local()
    local opts = {}
    local ok = pcall(require("telescope.builtin").git_files, opts)
    if not ok then
        require("telescope.builtin").find_files(opts)
    end
end

return {
    git_or_local = git_or_local,
}
