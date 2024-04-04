require('dapui').setup()
local dap = require('dap')
dap.configurations.rust = {
	{
		type = 'lldb',
		request = 'launch',
		name = "Launch file",
		program = "cargo",
	}
}

dap.adapters.lldb={
type="executable",
command='/usr/bin/lldb-vscode-14',
name='lldb'
}
dap.set_log_level('ERROR')
