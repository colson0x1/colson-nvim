local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		auto_hide = true,
		animated = false,
		tabpages = true,
		closable = false,
		clickable = true,
		icons = true,
		icon_custom_colors = false,
		icon_separator_active = "▎",
		icon_separator_inactive = "▎",
		icons_close_tab = "",
		icons_close_tab_modified = "●",
		icons_close_tab_selected = "",
		mouse_command = "bdelete!",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
			},
		},
		show_close_icon = false,
		show_buffer_close_icons = true,
		show_buffer_icons = true,
		show_tab_indicators = true,
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		sort_by = "extension",
		separator_style = "thin",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		diagnostics_update_time = 200,
		custom_areas = {
			linter = function()
				return {}
			end,
		},
		cyclic = false,
		trouble = false,
		trouble_modes = { "lsp_document_diagnostics", "lsp_workspace_diagnostics" },
		show_number = false,
		show_relative_numbers = false,
		close_command = "bdelete! %d",
		semantic_letters = true,
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
		name_formatter = function(buf)
			return vim.fn.pathshorten(vim.fn.fnamemodify(buf.name, ":t"))
		end,
		number_formatter = function(buf)
			return buf.ordinal
		end,
		mapper = " <a-",
		modifier = "s",
		hl_mappings = true,
		ignore_current_buffer = false,
		icons_padding = 1,
		icons_show_buffer_size = false,
		icons_show_buffer_close = false,
		icons_show_close_mark = false,
		icon_packs = {
			nevim = true,
			material = true,
			material_darker = true,
			fantasy = true,
		},
	},
})

-- Recommended mapping to toggle the bufferline
vim.api.nvim_set_keymap("n", "<C-e>", ":BufferLineToggle<CR>", { noremap = true, silent = true })
