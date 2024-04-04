vim.api.nvim_create_user_command("DapUiToggle",function ()
	require('dapui').toggle()
end,{nargs=0})
