local vim = vim

vim.cmd [[autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2]]

vim.g.dashboard_custom_section = {
    a_sessions = {
        description = {'  last session                         SPC s l'},
        command = 'SessionLoad'},
    b_recent_files = {
        description = {'  recent files                         SPC f h'},
        command =  'DashboardFindHistory'},
    c_find_files = {
        description = {'  find file                            SPC f f'},
        command = 'Telescope find_files find_command=rg,--hidden,--files'},
    d_search = {
        description = {'  search                               SPC f s'},
        command = 'DashboardFindWord'},
}

vim.g.dashboard_custom_footer = {'Don\'t be lazy, get moving!'}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_file = '~/.config/nvim/logo/llmy.cat'
vim.g.dashboard_preview_file_height = 16
vim.g.dashboard_preview_file_width = 60
