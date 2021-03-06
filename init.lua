local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

if not vim.g.vscode then
    require("startup.packer_scope").scope(require("nvim"))
else
    require("startup.packer_scope").scope(require("vscode"))
end
