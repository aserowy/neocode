local theme = require'configs.nvimbase16'.get_theme()

return {
    bg = '#'..theme.base01,
    inactive = '#'..theme.base02,
    active = '#'..theme.base04,
    error = '#'..theme.base08,
    warning = '#'..theme.base09,
    ok = '#'..theme.base0B,
    information = '#'..theme.base0C,

    highlight01 = '#'..theme.base0D,
    highlight02 = '#'..theme.base0E,
    highlight03 = '#'..theme.base0F,
}
