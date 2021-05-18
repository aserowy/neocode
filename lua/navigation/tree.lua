local function open()
    local offset = require'theming.theme'.get_sidebar_offset()
    require'bufferline.state'.set_offset(offset)
    require'nvim-tree'.find_file(true)
end

local function close()
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
end

return {
    open = open,
    close = close,
}
