local setup, rpc = pcall(require, "neocord")
if not setup then
	return
end

rpc.setup({
	-- General options
	logo = "auto", -- "auto" or url
	logo_tooltip = "Neovim made by (.cols)", -- nil or string
	main_image = "language", -- "language" or "logo"
	client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
	log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout = 86400, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time = true, -- Show the timer
	global_timer = false, -- if set true, timer won't update when any event are triggered

	-- Rich Presence text options
	editing_text = "%s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text = "%s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	-- Workspace - Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	workspace_text = function(_, filename)
		local root_directory = vim.fn.getcwd()
		local relative_path = vim.fn.fnamemodify(filename, ":~:.")
		local relative_parts = vim.fn.split(relative_path, "/")

		-- Exclude the root directory and filename from the subdirectories
		local filename_part = table.remove(relative_parts, #relative_parts)
		if filename_part == vim.fn.fnamemodify(root_directory, ":t") then
			-- Nested subdirectories
			filename_part = table.remove(relative_parts, #relative_parts)
		end

		-- Customize the format: "root dir → sub dirs"
		return string.format(
			"%s → " .. "/" .. "%s",
			vim.fn.fnamemodify(root_directory, ":t"),
			table.concat(relative_parts, "/")
		)
	end,

	line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
	terminal_text = "Using Terminal", -- Format string rendered when in terminal mode.
})
