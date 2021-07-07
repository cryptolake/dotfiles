lua <<EOF
local actions = require('telescope.actions')
require("telescope").setup {
	defaults = {
		-- Your defaults config goes in here
		mappings = {
			i = {
			--	["<C-n>"] = false,
			--	["<C-p>"] = false,
				["<c-d>"] = "delete_buffer",
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
				},
			n = {
				["<c-d>"] = "delete_buffer",
				--["<C-h>"] = "scroll",
				}
			}
		},
	pickers = {
		-- Your special builtin config goes in here
		buffers = {
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
			},
		find_files = {
			theme = "dropdown"
			}
		},
	extensions = {
		-- your extension config goes in here
		}
	}
EOF
