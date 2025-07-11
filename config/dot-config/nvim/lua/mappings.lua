-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keybinds for split windows

vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Make split windows equal width & height" })
vim.keymap.set("n", "<leader>x", ":close<CR>", { desc = "Close current split window" })

-- Keybinds for tab
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to new tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- Save file with ctrl-s
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Exit file with ctrl-q
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit file" })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping" })

-- [[ Plugins keymaps ]]
-- Toggle Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")

-- Toggle Markdown preview
vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<CR>", { desc = "[M]arkdown preview toggle" })

-- Persistence plugin => sessions manager
-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Load the session for the current directory" })

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
	require("persistence").select()
end, { desc = "Select a session to load" })

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Load the last session" })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Stop Persistence => session won't be saved on exit" })

-- Toggle line comment
-- vim.keymap.set("n", "<C-b>", "<cmd>gbc<CR>", { desc = "Toggle the current line using blockwise comment" })
vim.keymap.set("n", "<C-b>", function()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	require("mini.comment").toggle_lines(line, line)
end, { desc = "Toggle blockwise comment for current line" })

-- Toggle selection comment
vim.keymap.set("v", "<C-b>", function()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end
	require("mini.comment").toggle_lines(start_line, end_line)
end, { desc = "Toggle blockwise comment for selection" })

-- Url view
vim.keymap.set("n", "<leader>u", "<Cmd>UrlView<CR>", { desc = "View buffer URLs" })
vim.keymap.set("n", "<leader>U", "<Cmd>UrlView Lazy<CR>", { desc = "View Lazy plugin URLs" })
