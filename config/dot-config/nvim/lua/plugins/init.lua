-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- 'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
	--

	-- Alternatively, use `config = function() ... end` for full control over the configuration.
	-- If you prefer to call `setup` explicitly, use:
	-- require("plugins.colorscheme"),
	require("plugins.neo-tree"),
	require("plugins.indent-o-matic"),
	require("plugins.indent-blankline"),
	require("plugins.which-key"),
	require("plugins.fuzzy-finder"),
	require("plugins.autocompletion"),
	require("plugins.lsp"),
	require("plugins.autoformat"),
	require("plugins.todo-comments"),
	require("plugins.mini"),
	require("plugins.treesitter"),
	require("plugins.gitsigns"),
	require("plugins.markdown-preview"),
	require("plugins.dashboard"),
	require("plugins.persistence"),
	require("plugins.lualine"),
	require("plugins.url-view"),
	require("plugins.url-open"),
	require("plugins.presence"),
	require("plugins.harpoon"),
	require("plugins.wakatime"),
	require("plugins.noice"),
	require("plugins.hlsearch"),
	require("plugins.java"),
	require("plugins.nvim-dev-container"),
	-- require("plugins.smear-cursor"),
	-- require("plugins.scrollbar"),
	require("plugins.lazygit"),
	-- require("plugins.barbar"),
	require("plugins.neaterm"),
	require("plugins.pineapple"),

	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
