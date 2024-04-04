local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')


lspconfig.rust_analyzer.setup {
	cmd = {
		"rustup", "run", "stable", "rust-analyzer",
	}

}
local rt = require('rust-tools')
local opts = {
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			auto=true,
			show_parameter_hints = true,
			only_current_line=false,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			max_len_align = false,
			max_len_align_paddig = 1,
			right_align = false,
			highlight = "Comment"

		},
	},

	hover_actions = {

		-- the border that is used for the hover window
		-- see vim.api.nvim_open_win()
		border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		},

		-- Maximal width of the hover window. Nil means no max.
		max_width = nil,

		-- Maximal height of the hover window. Nil means no max.
		max_height = nil,

		-- whether the hover action window gets automatically focused
		-- default: false
		auto_focus =true,

	},
	executor = require("rust-tools.executors").termopen,
	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach =function(_,bufnr)

		 vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })

          	-- Code action groups
          	vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group(), { buffer = bufnr })
		end,
		standalone = false,
		capabilities = lsp_status.capabilities,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			-- and more: https://github.com/simrat39/rust-tools.nvim/wiki/Server-Configuration-Schema
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy"
				},
				assist={
					importEnforceGranularity=true,
					importPrefix=true,

				},
				cargo={
				allFeatures=true
				},
				inlayHints={
					lifetimeElisionHints={
						enable=true,
						useParameterNames=true
					}
				}
			}
		}
	},
	dap = {
		adapter = {
			type = "executable",
			command = "/usr/bin/lldb",
			name = "rt_lldb",
		},
	},
}
rt.setup(opts)

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})
