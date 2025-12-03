vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		require("telescope.builtin").find_files({
			prompt_title = "Find Files",
			cwd = vim.fn.getcwd(),
			hidden = true,
		})
	end,
})

--[[
-- Autocommand to open Telescope find_files when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- Hide all open buffers/windows first
		vim.cmd("silent! :bufdo bwipeout") -- Close all buffers except the current one
		vim.cmd("silent! :NvimTreeClose") -- Close NvimTree if it is open

		-- Now open Telescope
		require("telescope.builtin").find_files({
			prompt_title = "Find Files",
			cwd = vim.fn.getcwd(), -- Start search in the current directory
			hidden = true, -- Include hidden files
		})
	end,
})
]]
