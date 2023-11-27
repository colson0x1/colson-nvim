local status, autosave = pcall(require, "autosave")
if not status then
	return
end

autosave.setup({
	enable = true,
	prompt_style = "stdout",
	prompt_message = function()
		return "Autosave: saved at " .. vim.fn.strftime("%H:%M:%S")
	end,
	events = { "InsertLeave", "TextChanged", "VimLeavePre" },
	conditions = {
		exists = true,
		modifiable = true,
		filename_is_not = {},
		filetype_is_not = {},
	},
	write_all_buffers = false,
	debounce_delay = 100,
})
