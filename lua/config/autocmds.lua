vim.api.nvim_create_user_command("DapUiToggle", function()
	require('dapui').toggle()
end, { nargs = 0 })

vim.api.nvim_create_autocmd('TextYankPost',{
	desc = 'Highlight when yanking text',
	group= vim.api.nvim_create_augroup('kickstart-highlight-yank',{clear=true}),
	callback = function ()
			vim.highlight.on_yank()
	end
})


vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
