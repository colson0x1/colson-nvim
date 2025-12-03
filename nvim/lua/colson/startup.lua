-- ============================================================================
-- Auto-open Telescope on Neovim startup (Production-Stable)
-- Author: Colson (@colson0x1)
-- Description: Opens Telescope automatically when starting nvim
-- ============================================================================

-- DEBUG: Confirm this file is being loaded
vim.notify("Startup.lua loaded", vim.log.levels.INFO)

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- DEBUG: Confirm autocmd is firing
		vim.notify("VimEnter autocmd fired!", vim.log.levels.INFO)

		-- Check what was opened
		local args = vim.fn.argv()
		local argc = vim.fn.argc()

		-- Determine if we should open Telescope
		local should_open = false

		-- DEBUG: Show what we're checking
		vim.notify(string.format("argc=%d, args=%s", argc, vim.inspect(args)), vim.log.levels.INFO)

		if argc == 0 then
			-- No arguments (just 'nvim')
			should_open = true
			vim.notify("No args - will open Telescope", vim.log.levels.INFO)
		elseif argc == 1 then
			-- One argument - check if it's a directory
			local arg = args[1]
			if vim.fn.isdirectory(arg) == 1 then
				should_open = true
				vim.notify("Directory arg - will open Telescope", vim.log.levels.INFO)
			else
				vim.notify("File arg - will NOT open Telescope", vim.log.levels.INFO)
			end
		end

		if should_open then
			vim.notify("Opening Telescope in 500ms...", vim.log.levels.INFO)
			-- Delay to ensure all plugins loaded
			vim.defer_fn(function()
				-- Check if Telescope is available
				local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")

				vim.notify(
					string.format("Telescope available: %s", tostring(telescope_ok)),
					vim.log.levels.INFO
				)

				if telescope_ok then
					vim.notify("Calling telescope.find_files...", vim.log.levels.INFO)
					-- Additional schedule to ensure UI is ready
					vim.schedule(function()
						-- Final delay before opening
						vim.defer_fn(function()
							-- Try to open Telescope
							pcall(function()
								telescope_builtin.find_files({
									prompt_title = "Find Files",
									cwd = vim.fn.getcwd(),
									hidden = true,
									attach_mappings = function(prompt_bufnr, map)
										-- Enter insert mode after opening
										vim.schedule(function()
											vim.cmd("startinsert")
										end)
										return true
									end,
								})
							end)
						end, 150)
					end)
				end
			end, 350) -- Total: ~500ms delay
		end
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
