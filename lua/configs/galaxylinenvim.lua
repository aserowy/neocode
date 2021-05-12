local vim = vim

local gl = require('galaxyline')
local gls = gl.section
local conditions = require('galaxyline.condition')

local colors = require'colors'

local create_border = function (condition)
    local result = {
        provider = function() return '' end,
        separator = '| ',
        separator_highlight = {colors.highlight_line, colors.background_statusline},
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

local mode_normal = create_mode('N ', colors.vmode_normal)
local mode_insert = create_mode('I ', colors.vmode_insert)
local mode_visual = create_mode('V ', colors.vmode_visual)
local mode_visual_block = create_mode('B ', colors.vmode_visual)
local mode_terminal = create_mode('T ', colors.vmode_terminal)
local mode_undefined = create_mode('C ', colors.vmode_cmdline)

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
                vim.api.nvim_command('hi GalaxyViMode guifg='..colors.foreground_light..' guibg='..mode.bg)
                return mode.text
            end,
            separator = ' ',
            separator_highlight = {colors.highlight_line, colors.background_statusline},
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = conditions.buffer_not_empty,
            highlight = {require'galaxyline.provider_fileinfo'.get_file_icon_color, colors.background_statusline},
        },
    },
    {
        FileName = {
            provider = 'FileName',
            condition = conditions.buffer_not_empty,
            highlight = {colors.foreground, colors.background_statusline, 'bold'},
            separator = '| ',
            separator_highlight = {colors.highlight_line, colors.background_statusline},
        }
    },
    {
        GitIcon = {
            provider = function() return ' ' end,
            condition = conditions.check_git_workspace,
            icon = '',
            highlight = {colors.types, colors.background_statusline},
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = conditions.check_git_workspace,
            highlight = {colors.foreground, colors.background_statusline},
            separator = ' ',
            separator_highlight = {colors.background_statusline, colors.background_statusline},
        }
    },
    {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.git_deleted, colors.background_statusline},
        }
    },
    {
        DiffModified = {
            provider = 'DiffModified',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.git_changed, colors.background_statusline},
        }
    },
    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.git_inserted, colors.background_statusline},
        }
    },
    {
        Border = create_border(conditions.check_git_workspace),
    },
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = ' ',
            highlight = {colors.diagnostic_error, colors.background_statusline},
        }
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = ' ',
            highlight = {colors.diagnostic_warning, colors.background_statusline}
        }
    },
    {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = ' ',
            highlight = {colors.diagnostic_hint, colors.background_statusline}
        }
    },
    {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = ' ',
            highlight = {colors.diagnostic_information, colors.background_statusline}
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
            highlight = {colors.foreground, colors.background_statusline},
        }
    }
}

gls.right = {
    {
        PerCent = {
            provider = 'LinePercent',
            highlight = {colors.foreground_dark, colors.background_statusline},
        }
    },
    {
        FileEncode = {
            provider = 'FileEncode',
            condition = conditions.hide_in_width,
            highlight = {colors.foreground_dark, colors.background_statusline},
        }
    },
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.highlight_line, colors.background_statusline},
            separator = ' ',
            separator_highlight = {colors.background_statusline, colors.background_statusline},
        }
    },
}

-- short line
gl.short_line_list = {'LspTrouble', 'NvimTree', 'vista', 'dbui', 'packer'}

gls.short_line_left = {
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.background_statusline, colors.background_statusline},
            separator = ' ',
            separator_highlight = {colors.background_statusline, colors.background_statusline},
        }
    }
}

gls.short_line_right = {
    {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.background_statusline, colors.background_statusline},
            separator = ' ',
            separator_highlight = {colors.background_statusline, colors.background_statusline},
        }
    }
}
