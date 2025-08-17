
vim.deprecate = function() end

require("config.options")
require("config.lazy")
require("config.telescope")
require("config.mason")
require("config.keymaps")
require("config.lspconfig")
require("config.rust_tools")
vim.cmd('colorscheme cyberdream')
