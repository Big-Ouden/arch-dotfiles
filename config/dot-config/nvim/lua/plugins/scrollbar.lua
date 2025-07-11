-- scrollbar for neovim
-- https://github.com/Xuyuanp/scrollbar.nvim

return {
	"Xuyuanp/scrollbar.nvim",
	-- no setup required
	init = function()
		local group_id = vim.api.nvim_create_augroup("scrollbar_init", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "WinScrolled", "WinResized" }, {
			group = group_id,
			desc = "Show or refresh scrollbar",
			pattern = { "*" },
			callback = function()
				require("scrollbar").show()
			end,
		})
	end,
}
