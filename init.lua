local execute = vim.api.nvim_command
local fn = vim.fn

if not vim.g.vscode then
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
        execute("packadd packer.nvim")
    end

    require("plugins")
    require("language").setup()

    require("settings").setup()
    require("mappings").setup()
else
    local install_path = fn.stdpath("data") .. "/plugged"

    if fn.empty(fn.glob(install_path)) > 0 then
        execute(
            "!curl -fLo "
                .. [[ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]
                .. "--create-dirs "
                .. "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
        )
    end

    require("vscode").setup()
end
