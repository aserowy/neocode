local theme = require'configs.nvimbase16'.get_theme()

-- http://chriskempson.com/projects/base16/
return {
    background = '#'..theme.base00,
    background_statusline = '#'..theme.base01,
    background_selection = '#'..theme.base02,
    highlight_line = '#'..theme.base03,
    foreground_dark = '#'..theme.base04,
    foreground = '#'..theme.base05,
    foreground_light = '#'..theme.base06,
    background_light = '#'..theme.base07,

    --[[ variables = '#'..theme.base08,
    types = '#'..theme.base09,
    classes = '#'..theme.base0A,
    strings = '#'..theme.base0B,
    support = '#'..theme.base0C,
    functions = '#'..theme.base0D,
    keywords = '#'..theme.base0E,
    deprecation = '#'..theme.base0F, ]]

    git_deleted = '#'..theme.base08,
    git_inserted = '#'..theme.base0B,
    git_changed = '#'..theme.base0E,

    diagnostic_error = '#'..theme.base08,
    diagnostic_warning = '#'..theme.base0A,
    diagnostic_information = '#'..theme.base0B,
    diagnostic_hint = '#'..theme.base0C,

    vmode_normal = '#'..theme.base0D,
    vmode_visual = '#'..theme.base0E,
    vmode_terminal = '#'..theme.base0F,
    vmode_cmdline = '#'..theme.base08,
    vmode_insert = '#'..theme.base0B,
}
