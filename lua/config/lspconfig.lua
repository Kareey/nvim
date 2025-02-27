local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {

	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},

	},
}
lspconfig.clangd.setup({})

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })
sign({ name = 'DapToggleBreakPoint', text = '' })


local configs = require('lspconfig.configs')
if not configs.awklsp then
	configs.awklsp = {
		default_config = {
			cmd = { 'awk-language-server' },
			filetypes = { 'awk' },
			single_file_support = true,
			handlers = {
				['workspace/workspaceFolders'] = function()
					return { {
						uri = 'file://' .. vim.fn.getcwd(),
						name = 'current_dir',
					} }
				end
			}
		},
	}
end
lspconfig.awklsp.setup {}
lspconfig.cmake.setup({})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = true,
	signs = true,
	underline = true,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
	update_in_insert = true,

})
