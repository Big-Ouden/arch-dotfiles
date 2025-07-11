-- Collection of various small independent plugins/modules
-- https://github.com/echasnovski/mini.nvim

return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Functionality to work with two "paired" characters conditional on cursor's neighborhood (character to its left and character to its right).
		require("mini.pairs").setup()

		-- Commenting in Normal mode respects v:count and is dot-repeatable.
		-- Comment structure is inferred from 'commentstring': either from current buffer or from locally active tree-sitter language. It can be customized via options.custom_commentstring.
		-- Handles both tab and space indenting (but not when they are mixed).
		-- Allows custom hooks before and after successful commenting.
		-- Configurable options for some nuanced behavior.
		require("mini.comment").setup()

		-- Mini fast dashboard
		-- require("mini.starter").setup()

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
