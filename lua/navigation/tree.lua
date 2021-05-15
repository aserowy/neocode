local function open()
   require'bufferline.state'.set_offset(30)
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
