-- Typst preview plugin
-- https://github.com/chomosuke/typst-preview.nvim

return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}
