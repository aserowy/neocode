local vim = vim

local tree = {}
tree.open = function ()
   require'bufferline.state'.set_offset(31)
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
