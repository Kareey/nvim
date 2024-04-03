require('trouble').setup({
	position="bottom",
	height=10,
	width=50,
	icons=true,
	mode="workspace_diagnostics",
	severity=nil,
	group=true,
	padding=true,
	cycle_results=true,
	action_keys={
		close="q",
		cancel="<esc>",
		refresh="r",
		jump={"<cr>","<tab>","<2-leftmouse>"},
		open_split="<c-x>",
		open_vsplit="<c-v>",
		jump_close={"o"},
		toggle_mode="m",
		switch_severity="s",
		toggle_preview="p",
		open_code_href="c",
		close_folds={"zM","zm"},
		open_folds={"zR","zr"},
		toggle_fold={"zA","za"},
		previous="k",
		next="j",
		help="?"
	},
	multiline=true,
	indent_lines=true,
	win_config={border="single"},
	auto_open=false,
	auto_close=false,
	auto_preview=true,
	auto_fold=false,
	auto_jump={"lsp_definitions"},
	include_declaration={"lsp_references","lsp_implementations","lsp_definitions"},
	use_diagnostic_signs=false

})

local trouble = require("trouble")

local telescope= require("telescope")

telescope.setup({
defaults={
	mappings={
		i={["<c-t>"]=trouble.open_with_trouble},
		n={["<c-t>"]=trouble.open_with_trouble},

	}

}

})

