-- Dashboard plugin when you type "nvim"
-- https://github.com/nvimdev/dashboard-nvim

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
I use Arch btw
			]]
		logo = string.rep("\n", 5) .. logo .. "\n\n"
		local opts = {

			-- config
			theme = "doom",
			hide = {
				statusline = true,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{
						action = function()
							require("telescope.builtin").find_files()
						end,
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = function()
							require("telescope.builtin").oldfiles()
						end,
						desc = " Recent Files",
						icon = " ",
						key = "r",
					},
					{
						action = function()
							require("telescope.builtin").live_grep()
						end,
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = function()
							-- local path = os.getenv("DOTFILES") or "~/dotfiles"
							local path = "~/arch-dotfiles"
							require("telescope.builtin").find_files({ cwd = path })
						end,
						desc = " Dotfiles",
						icon = " ",
						key = "c",
					},
					{
						action = function()
							require("persistence").load()
						end,
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = "Lazy",
						desc = " Lazy",
						icon = "󰒲 ",
						key = "l",
					},
					{
						action = "Mason",
						desc = " Mason",
						icon = " ",
						key = "m",
					},
					{
						action = function()
							vim.cmd("qa")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}
		require("dashboard").setup(opts)

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = " %s"
		end

		-- Open dashboard after closing Lazy
		if vim.o.filetype == "Lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
