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

gls.left[1] = {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.highlight01,
                i = colors.ok,
                v = colors.highlight02,
                [''] = colors.highlight02,
                V = colors.highlight02,
                [''] = colors.highlight02,
                c = colors.highlight03,
                no = colors.highlight01,
                s = colors.warning,
                S = colors.warning,
                [''] = colors.warning,
                ic = colors.ok,
                R = colors.error,
                Rv = colors.error,
                cv = colors.highlight01,
                ce = colors.highlight01,
                r = colors.information,
                rm = colors.information,
                ['r?'] = colors.information,
                ['!'] = colors.highlight01,
                t = colors.highlight01
            }

            local color = mode_color[vim.fn.mode()]
            if color == nil then color = colors.information end

            vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)
            return '▊ '
        end,
        highlight = {colors.error, colors.bg}
    }
}

gls.left[2] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = conditions.buffer_not_empty,
        highlight = {require'galaxyline.provider_fileinfo'.get_file_icon_color, colors.bg},
    },
}

gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = conditions.buffer_not_empty,
        highlight = {colors.active, colors.bg, 'bold'},
        separator = '| ',
        separator_highlight = {colors.inactive, colors.bg},
    }
}

gls.left[4] = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = conditions.check_git_workspace,
        icon = '',
        highlight = {colors.warning, colors.bg},
    }
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = conditions.check_git_workspace,
        highlight = {colors.active, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
    }
}

gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = conditions.hide_in_width,
        icon = ' ',
        highlight = {colors.error, colors.bg},
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = conditions.hide_in_width,
        icon = '柳 ',
        highlight = {colors.highlight01, colors.bg},
    }
}

gls.left[8] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = conditions.hide_in_width,
        icon = ' ',
        highlight = {colors.ok, colors.bg},
    }
}

gls.left[9] = {
    Border = create_border(conditions.check_git_workspace),
}

gls.left[10] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = {colors.error, colors.bg},
    }
}

gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = {colors.warning, colors.bg}
    }
}

gls.left[12] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = ' ',
        highlight = {colors.information, colors.bg}
    }
}

gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = ' ',
        highlight = {colors.ok, colors.bg}
    }
}

gls.left[14] = {
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

gls.right[1] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.information, colors.bg},
    }
}

gls.right[2] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = conditions.hide_in_width,
        highlight = {colors.information, colors.bg},
    }
}

gls.right[3] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.inactive, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
    }
}

-- short line
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.short_line_left[1] = {
    Init = {
        provider = function() return '▊ ' end,
        highlight = {colors.inactive, colors.bg},
    },
}

gls.short_line_left[2] ={
    ShortFileIcon = {
        provider = 'FileIcon',
        condition = conditions.buffer_not_empty,
        highlight = {colors.inactive, colors.bg},
    },
}

gls.short_line_left[3] = {
    ShortFileName = {
        provider = 'FileName',
        condition = conditions.buffer_not_empty,
        highlight = {colors.inactive, colors.bg, 'bold'},
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.inactive, colors.bg}
    }
}

