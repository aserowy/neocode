-- TODO: https://github.com/wbthomason/packer.nvim/issues/272
if not require'checker'.packadd_if_exists('plenary.nvim') then
    return
end

require'gitsigns'.setup({
    numhl = false,
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil
})
