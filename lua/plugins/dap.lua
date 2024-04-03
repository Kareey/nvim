return {
	"jay-babu/mason-nvim-dap.nvim",
	opts=function (_,opts)
		opts.ensure_installed={"codelldb","cpptools"}
	end

}
