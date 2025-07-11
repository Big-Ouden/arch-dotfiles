-- A little (smart maybe) terminal plugin for neovim.
-- https://github.com/Dan7h3x/neaterm.nvim

return {
	"Dan7h3x/neaterm.nvim",
	branch = "stable",
	event = "VeryLazy",
	opts = {
		-- Your custom options here (optional)
		-- Default keymaps
		use_default_keymaps = true,
		keymaps = {
			toggle = "<A-t>",
			new_vertical = "<C-\\>",
			new_horizontal = "<C-:>",
			new_float = "<C-A-t>",
			close = "<C-w>",
			next = "<C-PageDown>",
			prev = "<C-PageUp>",
			move_up = "<C-A-Up>",
			move_down = "<C-A-Down>",
			move_left = "<C-A-Left>",
			move_right = "<C-A-Right>",
			resize_up = "<C-S-Up>",
			resize_down = "<C-S-Down>",
			resize_left = "<C-S-Left>",
			resize_right = "<C-S-Right>",
			focus_bar = "<C-A-b>",
			repl_toggle = "<leader>rt",
			repl_send_line = "<leader>rl",
			repl_send_selection = "<leader>rs",
			repl_send_buffer = "<leader>rb",
			repl_clear = "<leader>rc",
			repl_history = "<leader>rh",
			repl_variables = "<leader>rv",
			repl_restart = "<leader>rR",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
	},
}
