return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}
	},
	{
		"mrcjkb/rustaceanvim",
		dependencies = { "neovim/nvim-lspconfig", "lvimuser/lsp-inlayhints.nvim" },
		config=function ()
			require("config.rust_tools").setup()
		end
	},

	{
		"saecki/crates.nvim",
		dependencies = { "mrcjkb/rustaceanvim" },
		requires={"nvim-lua/plenary.nvim"},
		config=function ()
			require("crates").setup()
		end
	}


}
