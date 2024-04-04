local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb",
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
