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

-- ============================================================================
-- Directory launches: `nvim .` / `nvim ~/project` - straight into the project
-- ============================================================================
-- The dashboard is deliberately SKIPPED here: launching on a directory means
-- "open this project". The session is rooted in it (:cd), netrw renders the
-- project listing in the background, and Telescope find_files floats on top
-- - the classic colson-nvim project-entry flow. Dismiss Telescope (<Esc><Esc>
-- or <C-c>) and you land on netrw, ready to browse.
-- A bare `nvim` (no arguments) still gets the dashboard.
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("colson-startup-dir", { clear = true }),
	once = true,
	callback = function()
		if vim.fn.argc() ~= 1 or vim.fn.isdirectory(vim.fn.argv(0)) == 0 then
			return
		end

		-- Root the session in the project directory.
		pcall(vim.cmd.cd, vim.fn.fnameescape(vim.fn.argv(0)))

		-- Render netrw explicitly (:Ex - same engine as <leader>pv) so the
		-- project listing sits behind the Telescope float. nvim-tree's netrw
		-- hijack suppresses the AUTOMATIC directory takeover, so an explicit
		-- Explore is the reliable cross-setup way to get the listing.
		-- (hijack_directories is disabled in after/plugin/nvim-tree.lua so
		-- the tree doesn't grab this window either.)
		pcall(vim.cmd, "silent! Explore")

		-- Wipe the original directory-argument buffer so :bnext never lands
		-- on a dead "directory" buffer.
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if
				buf ~= vim.api.nvim_get_current_buf()
				and vim.fn.isdirectory(vim.api.nvim_buf_get_name(buf)) == 1
			then
				pcall(vim.api.nvim_buf_delete, buf, { force = true })
			end
		end

		-- Open the project picker once plugins are settled and netrw has
		-- rendered underneath.
		vim.defer_fn(function()
			local telescope_ok, telescope_builtin = pcall(require, "telescope.builtin")
			if not telescope_ok then
				return -- no Telescope yet (fresh install): netrw alone is fine
			end
			pcall(telescope_builtin.find_files, {
				prompt_title = "Find Files",
				cwd = vim.fn.getcwd(),
				hidden = true,
			})
		end, 80)
	end,
})

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
