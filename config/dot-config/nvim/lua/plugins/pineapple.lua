-- The ultimate theme manager for Neovim
-- https://github.com/CWood-sdf/pineapple

return {
	{
		"CWood-sdf/pineapple",
		dependencies = require("plugins.pineapple-theme"),
		opts = {
			installedRegistry = "plugins.pineapple-theme",
			colorschemeFile = "after/plugin/theme.lua",
		},
		cmd = "Pineapple",
	},
}
