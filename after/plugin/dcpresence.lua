local status, presence = pcall(require, "presence")
if not status then
	return
end

require("presence").setup({
	auto_update = true,
	neovim_image_text = "NVIM",
	main_image = "file",
	client_id = "793271441293967371",
	log_level = nil,
	debounce_timeout = 10,
	enable_line_number = false,
	blacklist = {},
	buttons = false,
	file_assets = {},
	show_time = true,

	editing_text = function(filename)
		local root_directory = vim.fn.getcwd()
		local relative_path = vim.fn.fnamemodify(filename, ":~:.")
		return string.format("%s", relative_path)
	end,

	file_explorer_text = "Browsing %s",

	git_commit_text = function(filename)
		return string.format("Committing changes in %s", filename)
	end,

	plugin_manager_text = "Managing plugins",

	reading_text = function(filename)
		return string.format("Reading %s", filename)
	end,

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
		return string.format("%s → %s", vim.fn.fnamemodify(root_directory, ":t"), table.concat(relative_parts, "/"))
	end,

	line_number_text = function(line_number, line_count)
		return string.format("Line %d out of %d", line_number, line_count)
	end,
})

-- @ Original
--[[
local status, presence = pcall(require, "presence")
if not status then
	return
end

presence.setup({
	auto_update = true,
	neovim_image_text = "NVIM",
	main_image = "file",
	client_id = "793271441293967371",
	log_level = nil,
	debounce_timeout = 10,
	enable_line_number = false,
	blacklist = {},
	buttons = false,
	file_assets = {},
	show_time = true,

	-- Rich Presence text options
	editing_text = "%s",
	file_explorer_text = "Browsing %s",
	git_commit_text = "Committing changes",
	plugin_manager_text = "Managing plugins",
	reading_text = "%s",
	workspace_text = "%s",
	-- line_number_text = "Line %s out of %s",
})
]]
--
