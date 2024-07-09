local M = {
    themes = {
        bluloco = {
            style = { "auto", "light", "dark" },
            transparent = false,
            lualine = function(_)
                return "auto"
            end,
            activate = function(style, transparent)
                require("bluloco").setup({
                    style = style,
                    transparent = transparent,
                })

                vim.cmd.colorscheme("bluloco")
            end,
        },
        catppuccin = {
            style = { "latte", "frappe", "macchiato", "mocha" },
            transparent = false,
            lualine = function(_)
                return "catppuccin"
            end,
            activate = function(style, transparent)
                require("catppuccin").setup({
                    flavour = style,
                    transparent_background = transparent,
                })

                vim.cmd.colorscheme("catppuccin")
            end,
        },
        dracula = {
            style = { "classic", "soft" },
            transparent = false,
            lualine = function(_)
                return "dracula-nvim"
            end,
            activate = function(style, _)
                require("dracula").setup({})

                local suffix = ""
                if style == "soft" then
                    suffix = "-soft"
                end

                vim.cmd.colorscheme("dracula" .. suffix)
            end,
        },
        github = {
            style = { "dark", "dark_dimmed", "dark_default", "light", "light_default" },
            transparent = false,
            lualine = function(style)
                return "github_" .. style
            end,
            activate = function(style, transparent)
                require("github-theme").setup({
                    options = { transparent = transparent },
                })

                vim.cmd.colorscheme("github_" .. style)
            end,
        },
        gruvbox = {
            style = { "light", "dark" },
            transparent = false,
            lualine = function(_)
                return "gruvbox"
            end,
            activate = function(style, _)
                vim.o.background = style
                vim.cmd.colorscheme("gruvbox")
            end,
        },
        material = {
            style = { "darker", "lighter", "oceanic", "palenight", "deep ocean" },
            transparent = false,
            lualine = function(_)
                return "material"
            end,
            activate = function(style, transparent)
                vim.g.material_style = style

                require("material").setup({
                    disable = {
                        background = transparent,
                        eob_lines = true,
                    },
                    high_visibility = {
                        lighter = true, -- Enable higher contrast text for lighter style
                    },
                })

                vim.cmd.colorscheme("material")
            end,
        },
        mellifluous = {
            style = { "dark", "light" },
            transparent = false,
            lualine = function(_)
                return "auto"
            end,
            activate = function(style, transparent)
                require("mellifluous").setup({
                    transparent_background = { enabled = transparent },
                })

                vim.o.background = style
                vim.cmd.colorscheme("mellifluous")
            end,
        },
        monokai = {
            style = { "classic", "octagon", "pro", "machine", "ristretto", "spectrum" },
            transparent = false,
            lualine = function(_)
                return "monokai-pro"
            end,
            activate = function(style, transparent)
                require("monokai-pro").setup({
                    filter = style,
                    transparent_background = transparent,
                })

                vim.cmd.colorscheme("monokai-pro")
            end,
        },
        nightfox = {
            style = { "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox" },
            transparent = false,
            lualine = function(style)
                return style
            end,
            activate = function(style, transparent)
                require("nightfox").setup({
                    transparent = transparent,
                })

                vim.cmd.colorscheme(style)
            end,
        },
        onedark = {
            style = { "dark", "darker", "cool", "deep", "warm", "warmer" },
            transparent = false,
            lualine = function(_)
                return "onedark"
            end,
            activate = function(style, transparent)
                require("onedark").setup({
                    style = style,
                    transparent = transparent,
                    transparent_sidebar = transparent,
                })

                require("onedark").load()
            end,
        },
        tokyonight = {
            style = { "storm", "moon", "night", "day" },
            transparent = false,
            lualine = function(_)
                return "tokyonight"
            end,
            activate = function(style, transparent)
                require("tokyonight").setup({
                    style = style,
                    transparent = transparent,
                })

                vim.cmd.colorscheme("tokyonight")
            end,
        },
    },
}

function M.activate_theme(theme, style, transparent)
    local entry = M.themes[theme]
    entry.activate(style, transparent)

    if transparent then
        vim.opt.cursorline = false
    else
        vim.opt.cursorline = true
    end

    require("lualine").setup({
        options = {
            theme = entry.lualine(style),
        },
    })
end

function M.get_lualine(theme, style)
    return M.themes[theme].lualine(style)
end

return M
