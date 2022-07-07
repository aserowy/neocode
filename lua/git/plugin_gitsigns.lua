require("gitsigns").setup({
    numhl = false,
    watch_gitdir = {
        interval = 100,
        follow_files = true
    },
    sign_priority = 5,
    status_formatter = nil,
})
