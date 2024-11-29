local telescope = require('telescope')
local lga_acts = require('telescope-live-grep-args.actions')
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add


telescope.setup({
	extensions = {
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					['<C-k>'] = lga_acts.quote_prompt(),
					['<C-i>'] = lga_acts.quote_prompt({ promtps = "--iglob" }),
				}
			},
			search_dirs = { vim.fn.getcwd() }
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		},

		defaults = {
			mappings = {
				i = { ["<c-t>"] = open_with_trouble },
				n = { ["<c-t>"] = open_with_trouble },
			},
		},
	}




})

telescope.load_extension('live_grep_args')
telescope.load_extension('fzf')

local harpoon = require('harpoon')
harpoon:setup()

local conf = require('telescope.config').values

local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	require('telescope.pickers').new({}, {
		prompt_title = "Harpoon",
		finder = require('telescope.finders').new_table({
			results = file_paths
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({})
	}):find()
end


vim.keymap.set('n', '<C-S-e>', function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
