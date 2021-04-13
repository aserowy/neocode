local vim = vim

local colors = require'colors'

-- common
vim.cmd('hi EndOfBuffer guifg='..colors.bg)
vim.cmd('hi LineNr guibg='..colors.bg)
vim.cmd('hi SignColumn guibg='..colors.bg)
vim.cmd('hi VertSplit guibg='..colors.bg)

-- dashboard
vim.cmd('hi DashboardHeader guifg='..colors.hint)
-- DashboardCenter
-- DashboardShortcut
-- DashboardFooter

-- gitsigns
vim.cmd('hi DiffAdd guibg='..colors.bg)
vim.cmd('hi DiffChange guibg='..colors.bg)
vim.cmd('hi DiffDelete guibg='..colors.bg)
vim.cmd('hi DiffModified guibg='..colors.bg)

-- lightbulb
vim.cmd('hi LightBulbSign guifg='..colors.information..' guibg='..colors.bg)

-- lsp
vim.cmd('hi LspDiagnosticsSignError guifg='..colors.error..' guibg='..colors.bg)
vim.cmd('hi LspDiagnosticsSignWarning guifg='..colors.warning..' guibg='..colors.bg)
vim.cmd('hi LspDiagnosticsSignInformation guifg='..colors.information..' guibg='..colors.bg)
vim.cmd('hi LspDiagnosticsSignHint guifg='..colors.hint..' guibg='..colors.bg)

-- popup
vim.cmd('hi Pmenu guibg='..colors.bg_accent)
vim.cmd('hi PmenuSel guibg='..colors.hint)
