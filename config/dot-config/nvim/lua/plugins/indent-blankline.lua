-- Indentation guides plugin
-- github.com/lukas-reineke/indent-blankline.nvim

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		debounce = 100,
		whitespace = { highlight = { "Whitespace", "NonText" } },
		-- scope = { exclude = { language = { "lua" } } },
		exclude = { filetypes = { "dashboard", "text" } },
	},
}
