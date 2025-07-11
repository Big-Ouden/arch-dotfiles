-- Dumb automatic indentation detection plugin
-- https://github.com/Darazaki/indent-o-matic

return {
	"Darazaki/indent-o-matic",
	opts = {
		-- The values indicated here are the defaults

		-- Number of lines without indentation before giving up (use -1 for infinite)
		max_lines = 2048,

		-- Space indentations that should be detected
		standard_widths = { 2 },

		-- Skip multi-line comments and strings (more accurate detection but less performant)
		skip_multiline = false,
	},
}
