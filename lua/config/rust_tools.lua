local rust_tools = {}

function rust_tools.setup()
	require("lazy").load({plugins="mason.nvim"})
	local codelldb_root = "~.local/share/nvim/mason/packages/codelldb/"
	local codelldb_path = codelldb_root .. "adapter/codelldb"
	local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"


	local cfg = require('rustaceanvim.config')

	vim.g.rustaceanvim = {
		dap = {
			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			autoload_configurations=false
		},
		inlay_hints = {
			highlight = true
		},
		tools = {
			hover_actions = {
				auto_focus = true
			}
		},
		runnables={
			use_telescpope=true
		},
		server = {
			on_attach = function(client, bufnr)
				vim.keymap.set("n","<C-space>",":RustLsp hover actions<CR>")
			end,
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				}

			}

		}





	}
end

return rust_tools
