--- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


vim.keymap.set("n", "<leader>ff", function()
	require('telescope.builtin').find_files()
end

, {})
vim.keymap.set({ 'n', 'v' }, "<S-d>", ":t.<CR>", { silent = true })
vim.keymap.set('n', '<C-A-h>', function()
	require('telescope.builtin').lsp_incoming_calls()
end)
vim.keymap.set('v', 'y', 'y`]');
vim.keymap.set('n', '<leader>gf', function() require('telescope.builtin').git_files() end, {})
vim.keymap.set('n', '<leader>gs',
	function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep:') }) end,
	{})
vim.keymap.set('n', '<leader>lg',
	function() require('telescope.builtin').live_grep({ grep_open_files = false }) end, {})
vim.keymap.set('n', '<leader>fo', function() require('telescope.builtin').oldfiles() end, {})
vim.keymap.set('n', '<leader>co', function() require('telescope.builtin').colorscheme() end, {})
vim.keymap.set('n', '<leader>la', function() require('telescope').extensions.live_grep_args.live_grep_args() end, {})
vim.keymap.set('n', '<leader>tg', function() require('telescope.builtin').help_tags() end, {})
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, {})
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { desc = "LSP references" })
vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, { desc = "LSP definitions" })
vim.keymap.set('n', 'ds', function() require('telescope.builtin').lsp_document_symbols() end,
	{ desc = "LSP document symbols" })
vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end, {
	desc =
	"LSP implementations"
})
vim.keymap.set('n', '<leader>qf', function() require('telescope.builtin').quickfixhistory() end, {})
vim.keymap.set('n', '<leader>ws', function() require('telescope.builtin').lsp_workspace_symbols() end, {})


vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",
	{ desc = "document diagnostics on opened buffers" })
vim.keymap.set("n", "<leader>gr", "<cmd>Trouble lsp_references toggle<CR>", { desc = "go to references" })
vim.keymap.set('n', '<leader>qf', "<cmd>Trouble quickfix toggle<CR>", {})
vim.keymap.set('n', '<leader>gR', function() require('trouble').toggle("lsp_references") end, {})
vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle("loclist") end, {})
vim.keymap.set('n', '<C-S>', '<C-c>:update<CR>', { silent = true })
vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<Esc>', ':q!<CR>', {})
vim.keymap.set('n', '<S-Esc>', ':wq<CR>', {})
vim.keymap.set('n', '<leader>tt', function()
	require('toggleterm').toggle()
end, {})





vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })



vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		vim.keymap.set('n', '<leader>ds', ":SymbolsOutline<CR>", {})
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set({ 'v', 'n' }, '<a-CR>', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<S-Q>', ':DocsViewToggle<CR>', {})
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	end,
})
local format_is_enabled = true
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
	-- This is where we attach the autoformatting for reasonable clients
	callback = function(args)
		local client_id = args.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)
		local bufnr = args.buf
		if client ~= nil then
			if not client.server_capabilities.documentFormattingProvider then
				return
			end
		end
	end,
})


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set('v', '<C-S-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<leader>p', "\"_dP")


vim.keymap.set('n', '<F8>', ":lua require('dap').step_over()<CR>", { silent = true })
vim.keymap.set('n', '<F10>', ":lua require('dap').continue()<CR>", { silent = true })
vim.keymap.set('n', '<leader>b', ":lua require('dap').toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set('n', '<F7>', ":lua require('dap').step_out()<CR>", { silent = true })
vim.keymap.set('n', '<F6>', ":lua require('dap').step_into()<CR>", { silent = true })
vim.keymap.set('n', '<C-d>', function()
	require('dapui').toggle()
end, { silent = true })
vim.keymap.set('n', '<leader>B', ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ silent = true })
vim.keymap.set('n', '<leader>lp', ":lua require('dap').set_breakpoint(nil,nil,vim.fn.input('Log point message: ')))<CR>",
	{ silent = true })

vim.keymap.set('n', '<leader>dr', ":lua require('dap').repl.open()<CR>", { silent = true })
vim.keymap.set('n', '<leader>dl', ":lua require('dap').step_into()<CR>", { silent = true })

local harpoon = require('harpoon')
vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-h>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', '<C-P>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<C-N>', function() harpoon:list():next() end)




local should_profile = os.getenv("NVIM_PROFILE")
if should_profile then
	require("profile").instrument_autocmds()
	if should_profile:lower():match("^start") then
		require("profile").stat("*")
	else
		require("profile").instrument("*")
	end
end

local function toggle_profile()
	local prof = require("profile")
	if prof.is_recording() then
		prof.stop()
		vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" },
			function(filename)
				if filename then
					prof.export(filename)
					vim.notify(string.format("Wrote %s", filename))
				end
			end)
	else
		prof.start("*")
	end
end
vim.keymap.set("", "<f1>", toggle_profile)

vim.api.nvim_set_keymap('n', '<leader>rr', ':w<CR>:lua require("rust-tools.runnables").runnables()<CR>', { noremap = true, silent =true}) 
