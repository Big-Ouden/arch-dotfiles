-- Highlight todo, notes, etc in comment
-- https://github.com/folke/todo-comments.nvim

return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- PERF: fully optimised
	-- FIX: ddddddasdasdasdasdasda
	-- PERF: dddd
	-- ddddd
	-- dddddd
	-- ddddddd
	-- FIXME: dddddd
	-- FIX: ddd
	-- HACK: hmmm, this looks a bit funky
	-- TODO: What else?
	-- NOTE: adding a note
	--
	-- FIX: this needs fixing
	-- WARNING: ???
	-- FIX: ddddd
	--       continuation
	-- @TODO foobar
	-- @hack foobar
	opts = {},
}
