-- Colorscheme
-- https://github.com/sainnhe/gruvbox-material/tree/master

return {
	-- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	-- "folke/tokyonight.nvim",
	-- "sainnhe/gruvbox-material",
	"morhetz/gruvbox",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		-- vim.g.gruvbox_material_enable_italic = true
		vim.cmd.colorscheme("gruvbox")
	end,
}
