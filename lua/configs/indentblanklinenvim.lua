local g = vim.g

g.indentLine_enabled = 1
g.indent_blankline_char = '▏'

g.indent_blankline_filetype_exclude = {'dashboard', 'help', 'terminal'}
g.indent_blankline_buftype_exclude = {'terminal'}

g.indent_blankline_show_current_context = true
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_show_trailing_blankline_indent = false
