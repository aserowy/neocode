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

-- panel
vim.cmd('hi TroubleCount guifg='..colors.foreground..' guibg='..colors.background)
vim.cmd('hi TroubleNormal guifg='..colors.foreground..' guibg='..colors.background_statusline)
vim.cmd('hi TroublePreview guifg='..colors.foreground..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleIndent guifg='..colors.foreground_dark..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleFoldIcon guifg='..colors.foreground_dark..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleFile guifg='..colors.foreground_light..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleText guifg='..colors.foreground..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleError guifg='..colors.diagnostic_error..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleSignError guifg='..colors.diagnostic_error..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleTextError guifg='..colors.diagnostic_error..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleWarning guifg='..colors.diagnostic_warning..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleSignWarning guifg='..colors.diagnostic_warning..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleTextWarning guifg='..colors.diagnostic_warning..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleInformation guifg='..colors.diagnostic_information..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleSignInformation guifg='..colors.diagnostic_information..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleTextInformation guifg='..colors.diagnostic_information..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleHint guifg='..colors.diagnostic_hint..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleSignHint guifg='..colors.diagnostic_hint..' guibg='..colors.background_statusline)
vim.cmd('hi TroubleTextHint guifg='..colors.diagnostic_hint..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleSignOther guifg='..colors.diagnostic_icon..' guibg='..colors.background_statusline)

vim.cmd('hi TroubleSource guifg='..colors.foreground_dark..' guibg='..colors.background_statusline..' gui=italic')
vim.cmd('hi TroubleCode guifg='..colors.foreground_dark..' guibg='..colors.background_statusline..' gui=italic')
vim.cmd('hi TroubleLocation guifg='..colors.foreground_dark..' guibg='..colors.background_statusline..' gui=italic')

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

-- popup
vim.cmd('hi Pmenu guibg='..colors.background_statusline)
vim.cmd('hi PmenuSel guibg='..colors.background_selection)

vim.cmd('hi LspSagaDiagnosticBorder guifg='..colors.foreground..' guibg='..colors.background)
vim.cmd('hi LspSagaDiagnosticHeader guifg='..colors.foreground..' guibg='..colors.background)
vim.cmd('hi LspSagaDiagnosticTruncateLine guifg='..colors.foreground..' guibg='..colors.background)
