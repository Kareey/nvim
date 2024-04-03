local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup({
spec={
        {"folke/trouble.nvim",opts={use_diagnostic_signs=true}},
	{"rose-pine/neovim",name="rose-pine",
	config=function()
	  vim.cmd[[colorscheme rose-pine]]
	  require("rose-pine").setup({
           disable_background=true

	  })
	end

},
	{import="plugins"}
	},
checker={enabled=true},


	})
vim.cmd[[colorscheme rose-pine]]
