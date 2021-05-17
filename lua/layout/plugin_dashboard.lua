vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_header = {
    '                  _________     _________     ',
    '____________________  ____/___________  /____ ',
    '__  __ \\  _ \\  __ \\  /    _  __ \\  __  /_  _ \\',
    '_  / / /  __/ /_/ / /___  / /_/ / /_/ / /  __/',
    '/_/ /_/\\___/\\____/\\____/  \\____/\\____/  \\___/ ',
    '                                              ',
}

vim.g.dashboard_custom_section = {
    b_recent_files = {
        description = {'  recent files                ctrl + f ctrl + h'},
        command =  'DashboardFindHistory'},
    c_find_files = {
        description = {'  find file                   ctrl + f ctrl + f'},
        command = [[lua require'custom.search'.git_or_local()]]},
    d_search = {
        description = {'  search grep                 ctrl + f ctrl + g'},
        command = 'Telescope live_grep'},
    e_search = {
        description = {'  seach symbols               ctrl + f ctrl + s'},
        command = 'Telescope lsp_workspace_symbols'},
}

vim.g.dashboard_custom_footer = {'Don\'t be lazy, get chillin!'}
