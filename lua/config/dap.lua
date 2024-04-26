require('dapui').setup()
require('nvim-dap-virtual-text').setup({
	enabled =true,



})

local dap = require('dap')
local mason_regisrtry = require('mason-registry')
local codelldb_root = mason_regisrtry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb_path = codelldb_root .. "adapter/codelldb"
local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

dap.adapters.codelldb = {
	type = "server",
	port = 13000,
	host = "127.0.0.1",
	executable = {
		command = codelldb_path,
		args = {
			"--liblldb", liblldb_path, "--port", "13000"
		}

	}
}

dap.configurations.codelldb = {
	{
		type = "codelldb",
		request = 'launch',
		program = "~/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/bin/lldb",
		terminal = "integrated",
		sourceLanguages = { "rust" }

	}

}

dap.set_log_level('ERROR')
