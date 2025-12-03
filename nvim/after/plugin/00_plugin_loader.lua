-- ============================================================================
-- Enterprise-Grade Plugin Loader - Error Handler
-- Author: Colson (@colson0x1)
-- Description: Graceful error handling for plugin configurations
-- ============================================================================

-- Suppress specific known warnings for plugins not yet configured
local suppress_patterns = {
	"rest.nvim",
	"fidget.nvim",
	"xml2lua",
	"mimetypes",
	"nvim-nio",
	"tree-sitter-http",
	"Telescope REST extension",
	"eslint_d",
	"Augment Server quit",
	"Client Augment Server",
}

-- Override vim.notify for startup to filter known warnings
local original_notify = vim.notify
local startup_complete = false

vim.notify = function(msg, level, opts)
	-- After startup, use normal notify
	if startup_complete then
		return original_notify(msg, level, opts)
	end

	-- During startup, filter known warnings
	if level == vim.log.levels.WARN then
		for _, pattern in ipairs(suppress_patterns) do
			if msg:find(pattern, 1, true) then
				-- Suppress this warning
				return
			end
		end
	end

	-- Show all other messages
	return original_notify(msg, level, opts)
end

-- Mark startup as complete after a delay
vim.defer_fn(function()
	startup_complete = true
	vim.notify = original_notify -- Restore original notify
end, 1000)

-- ============================================================================
-- Suppress Print Statements During Startup
-- ============================================================================
-- Some plugins use print() instead of vim.notify()
-- We'll redirect stderr to suppress those messages during startup

-- Suppress IO output for known noisy plugins
-- TEMPORARILY DISABLED FOR DEBUGGING
--[[
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		-- After VimEnter, let's suppress any remaining messages
		vim.defer_fn(function()
			-- Clear any messages on screen
			vim.cmd("silent! messages clear")
		end, 500)
	end,
})
--]]
