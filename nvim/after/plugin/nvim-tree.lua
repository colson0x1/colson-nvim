local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- Remove the netrw disable commands to allow it to work alongside nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Clear existing highlight groups before setting new ones
vim.cmd([[
  augroup NvimTreeHighlight
    autocmd!
    highlight clear NvimTreeIndentMarker
    highlight NvimTreeIndentMarker guifg=#47c8ff
  augroup END
]])

nvimtree.setup({
	disable_netrw = false, -- Allow netrw to work
	hijack_netrw = false, -- Don't hijack netrw windows
	view = {
		side = "right",
		width = 30,
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
	},
	system_open = {
		cmd = nil,
		args = {},
	},
})

-- Add keymaps after setup
local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
end

-- Attach the keymaps
vim.api.nvim_create_autocmd("FileType", {
	pattern = "NvimTree",
	callback = function(ev)
		on_attach(ev.buf)
	end,
})
