local theme = require'configs.nvimbase16'.get_theme()

return {
    bg = '#'..theme.base00,
    bg_accent = '#'..theme.base01,
    inactive = '#'..theme.base02,
    active = '#'..theme.base06,
    error = '#'..theme.base08,
    critical = '#'..theme.base09,
    warning = '#'..theme.base0A,
    ok = '#'..theme.base0B,
    information = '#'..theme.base0C,
    hint = '#'..theme.base0D,

    highlight02 = '#'..theme.base0E,
    highlight03 = '#'..theme.base0F,
}
