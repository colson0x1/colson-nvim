-- ============================================================================
-- Startup Behavior (Production-Stable)
-- Author: Colson (@colson0x1)
-- Description: Controls what appears when Neovim starts.
--
-- Since 2026-07-06 the dashboard (dashboard-nvim, DOOM layout by default)
-- owns the empty-argument startup screen - see after/plugin/dashboard.lua.
--
-- The previous behavior - auto-opening Telescope find_files on startup - is
-- fully preserved below behind an opt-in flag. To bring it back, set:
--   vim.g.colson_startup_telescope = true
-- (e.g. in lua/colson/set.lua). With the flag on, Telescope opens on top of
-- the dashboard exactly as it did before the dashboard existed.
-- ============================================================================

if vim.g.colson_startup_telescope == nil then
	vim.g.colson_startup_telescope = false
end

vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- Dashboard is the default start screen; Telescope auto-open is opt-in.
		if not vim.g.colson_startup_telescope then
			return
		end

		-- Check what was opened
		local args = vim.fn.argv()
		local argc = vim.fn.argc()

		-- Determine if we should open Telescope
		local should_open = false

		if argc == 0 then
			-- No arguments (just 'nvim')
			should_open = true
		elseif argc == 1 then
			-- One argument - check if it's a directory
			local arg = args[1]
			if vim.fn.isdirectory(arg) == 1 then
				should_open = true
			end
		end

		if should_open then
			-- Delay to ensure all plugins loaded
			vim.defer_fn(function()
				-- Check if Telescope is available
				local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")

				if telescope_ok then
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
