if not require("checker").packadd_if_exists("nvim-colorizer.lua") then
	return
end

require("colorizer").setup()
