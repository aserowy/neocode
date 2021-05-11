local vim = vim
local gl = require('galaxyline')
local gls = gl.section
local conditions = require('galaxyline.condition')

local colors = require'colors'

local create_border = function (condition)
    local result = {
        provider = function() return '' end,
        separator = '| ',
        separator_highlight = {colors.inactive, colors.bg},
    }
    if condition ~= nil then
        result.condition = condition
    end
    return result
end

local create_mode = function (text, bg)
    return {
        text = text,
        bg = bg,
    }
end

local mode_normal = create_mode('NORMAL ', colors.hint)
local mode_insert = create_mode('INSERT ', colors.ok)
local mode_visual = create_mode('VISUAL ', colors.highlight02)
local mode_visual_block = create_mode('VBLOCK ', colors.highlight02)
local mode_terminal = create_mode('TERMNL ', colors.highlight03)
local mode_undefined = create_mode('CMDLNE ', colors.error)

local get_mode = function (mode)
    local modes = {
        n = mode_normal,
        i = mode_insert,
        v = mode_visual,
        [''] = mode_visual,
        V = mode_visual,
        [''] = mode_visual_block,
        c = mode_undefined,
        no = mode_normal,
        s = mode_undefined,
        S = mode_undefined,
        [''] = mode_undefined,
        ic = mode_insert,
        R = mode_undefined,
        Rv = mode_undefined,
        cv = mode_normal,
        ce = mode_normal,
        r = mode_undefined,
        rm = mode_undefined,
        ['r?'] = mode_undefined,
        ['!'] = mode_normal,
        t = mode_terminal
    }

    local result = modes[mode]
    if result == nil then result = mode_undefined end

    return result
end

gls.left = {
    {
        ViModeSpace = {
            provider = function()
                local mode = get_mode(vim.fn.mode())
                vim.api.nvim_command('hi GalaxyViModeSpace guibg='..mode.bg)
                return ' '
            end,
        }
    },
    {
        ViMode = {
            provider = function()
                local mode = get_mode(vim.fn.mode())
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.active..' guibg='..mode.bg)
                return mode.text
            end,
            separator = ' ',
            separator_highlight = {colors.inactive, colors.bg},
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = conditions.buffer_not_empty,
            highlight = {require'galaxyline.provider_fileinfo'.get_file_icon_color, colors.bg},
        },
    },
    {
        FileName = {
            provider = 'FileName',
            condition = conditions.buffer_not_empty,
            highlight = {colors.active, colors.bg, 'bold'},
            separator = '| ',
            separator_highlight = {colors.inactive, colors.bg},
        }
    },
    {
        GitIcon = {
            provider = function() return ' ' end,
            condition = conditions.check_git_workspace,
            icon = '',
            highlight = {colors.critical, colors.bg},
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = conditions.check_git_workspace,
            highlight = {colors.active, colors.bg},
            separator = ' ',
            separator_highlight = {'NONE', colors.bg},
        }
    },
    {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.error, colors.bg},
        }
    },
    {
        DiffModified = {
            provider = 'DiffModified',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.hint, colors.bg},
        }
    },
    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.ok, colors.bg},
        }
    },
    {
        Border = create_border(conditions.check_git_workspace),
    },
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = ' ',
            highlight = {colors.error, colors.bg},
        }
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = ' ',
            highlight = {colors.warning, colors.bg}
        }
    },
    {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = ' ',
            highlight = {colors.hint, colors.bg}
        }
    },
    {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = ' ',
            highlight = {colors.information, colors.bg}
        }
    },
    {
        ShowLspClient = {
            provider = 'GetLspClient',
            condition = function()
                local tbl = {['dashboard'] = true, [' '] = true}
                if tbl[vim.bo.filetype] then return false end
                return true
            end,
            icon = ' ',
            highlight = {colors.active, colors.bg},
        }
    }
}

gls.right = {
    {
        PerCent = {
            provider = 'LinePercent',
            highlight = {colors.hint, colors.bg},
        }
    },
    {
        FileEncode = {
            provider = 'FileEncode',
            condition = conditions.hide_in_width,
            highlight = {colors.hint, colors.bg},
        }
    },
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.inactive, colors.bg},
            separator = ' ',
            separator_highlight = {'NONE', colors.bg},
        }
    },
}

-- short line
gl.short_line_list = {'LspTrouble', 'NvimTree', 'vista', 'dbui', 'packer'}

gls.short_line_left = {
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.bg, colors.bg},
            separator = ' ',
            separator_highlight = {colors.bg, colors.bg},
        }
    }
}

gls.short_line_right = {
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.bg, colors.bg},
            separator = ' ',
            separator_highlight = {colors.bg, colors.bg},
        }
    }
}
