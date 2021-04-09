local vim = vim
local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')

local colors = {
    bg = 'NONE',
    yellow = '#DCDCAA',
    dark_yellow = '#D7BA7D',
    cyan = '#4EC9B0',
    green = '#608B4E',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FF8800',
    purple = '#C586C0',
    magenta = '#D16D9E',
    grey = '#858585',
    blue = '#569CD6',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#D16969',
    error_red = '#F44747',
    info_yellow = '#FFCC66'
}

local border = {
    provider = function() return '' end,
    highlight = {colors.orange, colors.bg},
    separator = '| ',
    separator_highlight = {colors.grey, colors.bg},
}

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }

            local color = mode_color[vim.fn.mode()]
            if color == nil then color = colors.vivid_blue end

            vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)
            return '▊ '
        end,
        highlight = {colors.red, colors.bg}
    }
}

gls.left[2] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require'galaxyline.provider_fileinfo'.get_file_icon_color, colors.bg},
    },
}

gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.magenta, colors.bg, 'bold'},
        separator = '| ',
        separator_highlight = {colors.grey, colors.bg},
    }
}

gls.left[4] = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = condition.check_git_workspace,
        icon = '',
        highlight = {colors.orange, colors.bg},
    }
}

gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.grey, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
    }
}

gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.green, colors.bg},
    }
}

gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = '柳 ',
        highlight = {colors.blue, colors.bg},
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = ' ',
        highlight = {colors.red, colors.bg},
    }
}

gls.left[9] = {
    Border = border,
}

gls.left[10] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = ' ',
        highlight = {colors.error_red, colors.bg},
    }
}

gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = ' ',
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[12] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = ' ',
        highlight = {colors.vivid_blue, colors.bg}
    }
}

gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = ' ',
        highlight = {colors.info_yellow, colors.bg}
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
        highlight = {colors.grey, colors.bg},
    }
}

gls.right[1] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.vivid_blue, colors.bg},
    }
}

gls.right[2] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        highlight = {colors.vivid_blue, colors.bg},
    }
}

gls.right[3] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.orange, colors.bg},
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
    }
}

-- short line
gls.short_line_left[1] = {
    Init = {
        provider = function() return '▊ ' end,
        highlight = {colors.grey, colors.bg},
    },
}

gls.short_line_left[2] ={
    ShortFileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = colors.grey, colors.bg,
    },
}

gls.short_line_left[3] = {
    ShortFileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.grey, colors.bg, 'bold'},
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.grey, colors.bg}
    }
}

