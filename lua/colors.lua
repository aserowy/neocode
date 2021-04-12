local theme = require'configs.nvimbase16'.get_theme()

return {
    bg = '#'..theme.base00,
    bg_accent = '#'..theme.base01,
    inactive = '#'..theme.base02,
    active = '#'..theme.base04,
    error = '#'..theme.base08,
    warning = '#'..theme.base09,
    hint = '#'..theme.base0A,
    ok = '#'..theme.base0B,
    information = '#'..theme.base0C,

    highlight01 = '#'..theme.base0D,
    highlight02 = '#'..theme.base0E,
    highlight03 = '#'..theme.base0F,
}

-- solarized-dark
--  base00 = "#002b36"; base01 = "#073642"; base02 = "#586e75"; base03 = "#657b83";
--  base04 = "#839496"; base05 = "#93a1a1"; base06 = "#eee8d5"; base07 = "#fdf6e3";
--  base08 = "#dc322f"; base09 = "#cb4b16"; base0A = "#b58900"; base0B = "#859900";
--  base0C = "#2aa198"; base0D = "#268bd2"; base0E = "#6c71c4"; base0F = "#d33682";
