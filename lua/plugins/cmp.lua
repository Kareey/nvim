return {
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip', {
	"amrbashir/nvim-docs-view",
	opt = true,
	cmd = { "DocsViewToggle" },
	config = function()
		require("docs-view").setup {
			position = "right",
			width = 90,
		}
	end
}
}
