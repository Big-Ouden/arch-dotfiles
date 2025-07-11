-- Adds git related signs to the gutter, as well as utilities for managing changes
-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			-- Your gitsigns configuration here
		})
	end,
}
