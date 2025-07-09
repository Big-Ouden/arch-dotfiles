print("autocommands")

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`


-- Highlight when yanking text
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'highlight when yanking text',
	group = vim.api.nvim_create_augroup('nvim-highlight-yank', {clear=true}),
	callback = function()
		vim.hl.on_yank()
	end,
})


