if not require("checker").packadd_if_exists("lualine.nvim") then
	return
end

local function setup()
	local theme = require("theming.theme").get_lualine()

	require("lualine").setup({
		extensions = { "nvim-tree" },
		options = {
			theme = theme,
			component_separators = { "", "" },
			disabled_filetypes = { "toggleterm", "terminal" },
			section_separators = { "", "" },
		},
		sections = {
			lualine_b = {
				"branch",
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
			},
			lualine_c = {
				"filename",
				{
					"diagnostics",
					sources = { "nvim_lsp" },
				},
			},
		},
	})
end

return {
	setup = setup,
}
