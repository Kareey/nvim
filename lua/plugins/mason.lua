local function setup_lsp_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true
	})
end


return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		}
	},
	{
		"mrcjkb/rustaceanvim",
		dependencies = { "lvimuser/lsp-inlayhints.nvim" },
		config = function()
			 require("config.rust_tools").setup()
			-- setup_lsp_diags()
		end
	},

}
