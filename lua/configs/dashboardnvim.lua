local vim = vim

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
    '       ,gggg,        ,gggg,                ,ggg,         gg ',
    '      d8" "8I       d8" "8I               dP""Y8a        88 ',
    '      88  ,dP       88  ,dP               Yb, `88        88 ',
    '   8888888P"     8888888P"                 `"  88        88 ',
    '      88            88                         88        88 ',
    '      88            88         ,ggg,,ggg,,ggg, 88        88 ',
    ' ,aa,_88       ,aa,_88        ,8" "8P" "8P" "8,88       ,88 ',
    'dP" "88P      dP" "88P        I8   8I   8I   8IY8b,___,d888 ',
    'Yb,_,d88b,,_  Yb,_,d88b,,_   ,dP   8I   8I   Yb,"Y88888P"88,',
    ' "Y8P"  "Y88888"Y8P"  "Y888888P\'   8I   8I   `Y8     ,ad8888',
    '                                                    d8P" 88 ',
    '                                                  ,d8\'   88 ',
    '                                                  d8\'    88 ',
    '                                                  88     88 ',
    '                                                  Y8,_ _,88 ',
}

vim.g.dashboard_custom_section = {
--[[ a_sessions = {
description = {'  last session                         SPC s l'},
    command = 'SessionLoad'}, ]]
    b_recent_files = {
        description = {'  recent files                         SPC f h'},
        command =  'DashboardFindHistory'},
    c_find_files = {
        description = {'  find file                            SPC f f'},
        command = [[lua require'custom.search'.git_or_local()]]},
    d_search = {
        description = {'  search                               SPC f s'},
        command = 'Telescope live_grep'},
}

vim.g.dashboard_custom_footer = {'Don\'t be lazy, get moving!'}
