-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.opt.number= true
vim.g.laststatus=2
vim.opt.nu=true
vim.opt.smartcase= true
vim.opt.ignorecase=true
vim.opt.completeopt = { 'menu', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.g.material_style="darker"
vim.opt.splitright = true
vim.opt.updatetime= 200
vim.opt.autoindent = true
vim.opt.lazyredraw=true
vim.opt.syntax="on"
vim.opt.background='dark'
vim.opt.swapfile=false
vim.opt.hlsearch=false
vim.opt.incsearch=true
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10
vim.opt.smartindent= true
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile= false
vim.opt.termguicolors =true
vim.opt.writebackup = false
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.g.inlay_hints_visible = true
vim.opt.tabstop = 4
vim.opt.shiftwidth= 4
vim.g.loaded_netrw=1
vim.g.loaded_netrwPlugin=1
vim.opt.clipboard= "unnamedplus"
vim.opt.wrap = true
vim.opt.inccommand = "split"
