local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/share/lldb-vscode",
	name = "lldb"
}


dap.configuration.rust = {
	{
	name="helloworld",
	type="lldb",
	request="launch",
	program=function ()
		return vim.fn.getcwd().."/target/debug/helloworld"
	end,
	cwd="${workspaceFolder}",

	}



}
