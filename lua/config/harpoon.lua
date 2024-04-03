local harpoon =require('harpoon')
harpoon:setup()
vim.keymap.set('n','<leader>a',function() harpoon:list():add() end)
vim.keymap.set('n','<C-h>',function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n','<C-P>',function() harpoon:list():prev() end)
vim.keymap.set('n','<C-N>',function() harpoon:list():next() end)
