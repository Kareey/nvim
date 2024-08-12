-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.g.laststatus=2
vim.opt.nu=true
vim.opt.completeopt = { 'menu', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.g.material_style="darker"
vim.opt.splitright = true
vim.opt.updatetime= 600
vim.opt.autoindent = true
vim.opt.lazyredraw=true
vim.opt.syntax="on"
vim.opt.background='dark'
vim.opt.swapfile=false
vim.opt.hlsearch=false
vim.opt.incsearch=true
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
