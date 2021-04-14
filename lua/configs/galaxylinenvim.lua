local vim = vim
local gl = require('galaxyline')
local gls = gl.section
local conditions = require('galaxyline.condition')

local colors = require'colors'

local create_border = function (condition)
    local result = {
        provider = function() return '' end,
        separator = '| ',
        separator_highlight = {colors.inactive, colors.bg_accent},
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

local mode_normal = create_mode('  ', colors.hint)
local mode_insert = create_mode('  ', colors.ok)
local mode_visual = create_mode(' ﯎ ', colors.highlight02)
local mode_visual_block = create_mode('  ', colors.highlight02)
local mode_terminal = create_mode('  ', colors.highlight03)
local mode_undefined = create_mode('  ', colors.error)

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
            separator_highlight = {colors.inactive, colors.bg_accent},
        }
    },
    {
        FileIcon = {
            provider = 'FileIcon',
            condition = conditions.buffer_not_empty,
            highlight = {require'galaxyline.provider_fileinfo'.get_file_icon_color, colors.bg_accent},
        },
    },
    {
        FileName = {
            provider = 'FileName',
            condition = conditions.buffer_not_empty,
            highlight = {colors.active, colors.bg_accent, 'bold'},
            separator = '| ',
            separator_highlight = {colors.inactive, colors.bg_accent},
        }
    },
    {
        GitIcon = {
            provider = function() return ' ' end,
            condition = conditions.check_git_workspace,
            icon = '',
            highlight = {colors.critical, colors.bg_accent},
        }
    },
    {
        GitBranch = {
            provider = 'GitBranch',
            condition = conditions.check_git_workspace,
            highlight = {colors.active, colors.bg_accent},
            separator = ' ',
            separator_highlight = {'NONE', colors.bg_accent},
        }
    },
    {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.error, colors.bg_accent},
        }
    },
    {
        DiffModified = {
            provider = 'DiffModified',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.hint, colors.bg_accent},
        }
    },
    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = conditions.hide_in_width,
            icon = ' ',
            highlight = {colors.ok, colors.bg_accent},
        }
    },
    {
        Border = create_border(conditions.check_git_workspace),
    },
    {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = ' ',
            highlight = {colors.error, colors.bg_accent},
        }
    },
    {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = ' ',
            highlight = {colors.warning, colors.bg_accent}
        }
    },
    {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = ' ',
            highlight = {colors.hint, colors.bg_accent}
        }
    },
    {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = ' ',
            highlight = {colors.information, colors.bg_accent}
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
            highlight = {colors.active, colors.bg_accent},
        }
    }
}

gls.right[1] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.hint, colors.bg_accent},
    }
}

gls.right[2] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = conditions.hide_in_width,
        highlight = {colors.hint, colors.bg_accent},
    }
}

gls.right[3] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.inactive, colors.bg_accent},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg_accent},
    }
}

-- short line
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.short_line_left[1] = {
    Init = {
        provider = function() return ' ' end,
        highlight = {colors.inactive, colors.bg_accent},
    },
}

gls.short_line_left[2] ={
    ShortFileIcon = {
        provider = 'FileIcon',
        condition = conditions.buffer_not_empty,
        highlight = {colors.inactive, colors.bg_accent},
    },
}

gls.short_line_left[3] = {
    ShortFileName = {
        provider = 'FileName',
        condition = conditions.buffer_not_empty,
        highlight = {colors.inactive, colors.bg_accent, 'bold'},
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.inactive, colors.bg_accent}
    }
}

