local vim = vim

local colors = require'colors'

-- common
vim.cmd('hi EndOfBuffer guifg='..colors.background)
vim.cmd('hi LineNr guibg='..colors.background)
vim.cmd('hi SignColumn guibg='..colors.background)
vim.cmd('hi StatusLine guibg='..colors.background_statusline)
vim.cmd('hi StatusLineNC guibg='..colors.background_statusline)
vim.cmd('hi VertSplit guibg='..colors.background)

-- dashboard
vim.cmd('hi DashboardHeader guifg='..colors.foreground_light)

-- tree
vim.cmd('hi NvimTreeNormal guibg='..colors.background_statusline)
vim.cmd('hi NvimTreeVertSplit guifg='..colors.background_statusline..' guibg='..colors.background_statusline)
vim.cmd('hi NvimTreeEndOfBuffer guifg='..colors.background_statusline)

-- gitsigns
vim.cmd('hi DiffAdd guifg='..colors.git_inserted..' guibg='..colors.background)
vim.cmd('hi DiffChange guifg='..colors.git_changed..' guibg='..colors.background)
vim.cmd('hi DiffDelete guifg='..colors.git_deleted..' guibg='..colors.background)
vim.cmd('hi DiffModified guifg='..colors.git_changed..' guibg='..colors.background)

-- lightbulb
vim.cmd('hi LspSagaLightBulbSign guifg='..colors.diagnostic_warning..' guibg='..colors.background)

-- lsp
vim.cmd('hi LspDiagnosticsDefaultError guifg='..colors.diagnostic_error..' guibg='..colors.background)
vim.cmd('hi LspDiagnosticsDefaultWarning guifg='..colors.diagnostic_warning..' guibg='..colors.background)
vim.cmd('hi LspDiagnosticsDefaultInformation guifg='..colors.diagnostic_information..' guibg='..colors.background)
vim.cmd('hi LspDiagnosticsDefaultHint guifg='..colors.diagnostic_hint..' guibg='..colors.background)

vim.cmd('hi LspSagaDiagnosticBorder guifg='..colors.foreground..' guibg='..colors.background)
vim.cmd('hi LspSagaDiagnosticHeader guifg='..colors.foreground..' guibg='..colors.background)
vim.cmd('hi LspSagaDiagnosticTruncateLine guifg='..colors.foreground..' guibg='..colors.background)

-- popup
vim.cmd('hi Pmenu guibg='..colors.background_statusline)
vim.cmd('hi PmenuSel guibg='..colors.background_selection)
