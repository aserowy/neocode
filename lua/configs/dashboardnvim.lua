local vim = vim

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
'           ,ggg,                 ,ggg,        gg             ',
'          dP""8I   ,dPYb,       dP""Y8b       88             ',
'         dP   88   IP\'`Yb       Yb, `88       88             ',
'        dP    88   I8  8I        `"  88       88             ',
'       ,8\'    88   I8  8\'            88aaaaaaa88             ',
'       d88888888   I8 dP  gg      gg 88"""""""88    ,gggg,gg ',
' __   ,8"     88   I8dP   I8      8I 88       88   dP"  "Y8I ',
'dP"  ,8P      Y8   I8P    I8,    ,8I 88       88  i8\'    ,8I ',
'Yb,_,dP       `8b,,d8b,_ ,d8b,  ,d8b,88       Y8,,d8,   ,d8b,',
' "Y8P"         `Y88P\'"Y888P\'"Y88P"`Y888       `Y8P"Y8888P"`Y8',
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

vim.g.dashboard_custom_footer = {'Don\'t be lazy, get chillin!'}
