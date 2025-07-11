-- UrlView is an extensible plugin for the Neovim text editor which essentially:
--
-- Finds URLs from a variety of search contexts (e.g. from a buffer, file, plugin URLs)
-- Displays these URLs in a picker, such as the built-in vim.ui.select or telescope.nvim
-- Performs actions on selected URLs, such as navigating to the URL in your preferred browser, or copying the link to your clipboard
--
-- https://github.com/axieax/urlview.nvim

return {
	"axieax/urlview.nvim",
	opts = {},
}
