require("nvim-treesitter.configs").setup({
  ensure_installed={"vimdoc","lua","c","javascript","typescript","rust","toml"},
  syn_install=true,
  auto_install=true,
  indent={enabled=true},
  highlight={
	enable=true,
	additional_vim_regex_highlighting={"markdown"}	

  },
  rainbow={
	enable=true,
	extended_mode=true,
	max_file_lines=nil
  }

})

local ts_parser_config=require("nvim-treesitter.parsers").get_parser_configs()
ts_parser_config.templ = {
	install_info= {
		url="https://github.com/vrischmann/tree-sitter-templ.git",
		files = {"src/parser.c","src/scanner.c"},
		branch="master",
	}
}

vim.treesitter.language.register('templ','templ')






