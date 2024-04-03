-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby
vim.g.mapleader = " "
vim.wo.relativenumber=true


vim.opt.completeopt = {'menu', 'preview'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.g.netrw_liststyle=3
vim.g.netrw_browse_split=4
vim.g.netrw_winsize=20
vim.g.netrw_alto="topright"
vim.g.netrw_preview=1

vim.api.nvim_set_option('updatetime', 300)
vim.opt.splitright=true





vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

