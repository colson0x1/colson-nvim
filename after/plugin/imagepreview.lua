local status, imagepreview = pcall(require, "chafa")
if not status then
	return
end

imagepreview.setup({
	render = {
		min_padding = 5,
		show_label = true,
	},
	events = {
		update_on_nvim_resize = true,
	},
})
