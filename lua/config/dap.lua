require('dapui').setup()
local dap = require('dap')
dap.adapters.codelldb = {
	type = 'server',
	port = 13000,
	executable={
		command="~/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
		args={"--port","13000"}

	}
}

dap.configurations.rust={
	{type="codelldb",
	request='launch',
	program="~.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
	cwd='$(workspaceFolder)',
	terminal="integrated",
	sourceLanguages={"rust"}

}

}

dap.set_log_level('ERROR')
