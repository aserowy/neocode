local function git_or_local()
    local ok = pcall(require("telescope.builtin").git_files, { use_git_root = false })
    if not ok then
        require("telescope.builtin").find_files()
    end
end

return {
    git_or_local = git_or_local,
}
