local vim = vim

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
'                  _________     _________     ',
'____________________  ____/___________  /____ ',
'__  __ \\  _ \\  __ \\  /    _  __ \\  __  /_  _ \\',
'_  / / /  __/ /_/ / /___  / /_/ / /_/ / /  __/',
'/_/ /_/\\___/\\____/\\____/  \\____/\\__,_/  \\___/ ',
'                                              ',
}

vim.g.dashboard_custom_section = {
--[[ a_sessions = {
description = {'  last session                         SPC s l'},
    command = 'SessionLoad'}, ]]
    b_recent_files = {
        description = {'  recent files                                 '},
        command =  'DashboardFindHistory'},
    c_find_files = {
        description = {'  find file                            ctrl + f'},
        command = [[lua require'custom.search'.git_or_local()]]},
    d_search = {
        description = {'  search                               ctrl + g'},
        command = 'Telescope live_grep'},
}

vim.g.dashboard_custom_footer = {'Don\'t be lazy, get chillin!'}
