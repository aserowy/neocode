local uname = vim.loop.os_uname()
local os = uname.sysname
local is_linux = os == "Linux"

return {
    os = os,
    is_mac = os == "Darwin",
    is_linux = is_linux,
    is_windows = os:match("Windows"),
    is_wsl = is_linux and uname.release:match("Microsoft"),
}
