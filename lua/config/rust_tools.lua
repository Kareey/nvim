local rust_tools = {}
function rust_tools.setup()
	--	require("lazy").load({plugins="mason.nvim"})
	local codelldb_root = "~/.local/share/nvim/mason/packages/codelldb/"
	local codelldb_path = codelldb_root .. "adapter/codelldb"
	local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"


	local cfg = require('rustaceanvim.config')

	vim.g.rustaceanvim = {
		dap = {
			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			autoload_configurations = true
		},
		inlay_hints = {
			highlight = true
		},
		tools = {
			hover_actions = {
				auto_focus = false
			},
			reload_workspace_from_cargo_toml = true,
			float_win_config = {
				auto_focus = true,
				open_split = "horizontal"
			}
		},
		runnables = {
			use_telescpope = true
		},
		server = {
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable()
				vim.keymap.set("n", "<C-space>", ":RustLsp hover actions<CR>", { silent = true })
			end,
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				},

			},
			auto_attach = true,
			standalone = true,
		}

	}
end

return rust_tools
