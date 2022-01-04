local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

if not vim.g.vscode then
    local nvim_configuration = require("nvim")
    local path = fn.stdpath("data") .. "/packer_compiled.lua"

    require("startup.packer_scope").scope(nvim_configuration, path)
else
    local vscode_configuration = require("vscode")
    local path = fn.stdpath("data") .. "/packer_compiled_vscode.lua"

    require("startup.packer_scope").scope(vscode_configuration, path)
end
