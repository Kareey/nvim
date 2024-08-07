-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.options")

require("config.lazy")
require("config.tokyonight")
require("config.keymaps")
require("config.treesitter")
require("config.trouble")
require("config.lspconfig")
require("config.cmp")
require("config.telescope")
require("config.winbar")
require("config.git")
require("config.autocmds")
require("config.dap")
require("config.nvimtree")
require("config.sonokai")
require("config.lualine")

vim.cmd([[
colorscheme material
]])
